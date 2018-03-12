 import Alamofire
 import Foundation
 
 import ObjectMapper
 import SwiftyJSON
 import CryptoSwift //https://github.com/krzyzanowskim/CryptoSwift#calculate-digest
 
 public class Service {
    public static let sharedClient = Service()
    
    public var consumerKey: String
    public var consumerSecret: String
    public var siteDomain: String
    public var isSSL: Bool = false
    public var siteURL: String
    
    
    init() {
        self.siteDomain =  ""
        self.consumerKey = ""
        self.consumerSecret = ""
        
        if(isSSL){
            self.siteURL = "https://" + self.siteDomain
        }else{
            self.siteURL = "http://" + self.siteDomain
        }
    }
    
    fileprivate func getPercentEncoding(string: String)-> String{
        let customAllowedSet =  NSCharacterSet(charactersIn:"=:\"#&%/<>?@\\^`{|}").inverted
        return string.addingPercentEncoding(withAllowedCharacters:customAllowedSet)!
    }
    fileprivate func getEncData(requestMethod:String, requestURL:String, requestParams:String ) ->String{
        var returnStr:String
        do {
            let readyToEnc = (requestMethod + "&" + getPercentEncoding(string: requestURL) + "&" +  getPercentEncoding(string: requestParams))
            let key = self.consumerSecret + "&"
            returnStr = (try HMAC(key: key, variant: .sha256).authenticate((readyToEnc.bytes)).toBase64())!
        }catch{
            returnStr = ""
        }
        return returnStr
        
    }
    fileprivate func queryString(extraParam: Dictionary<String, String>) -> String{
        
        var componentArray:[String] = Array(extraParam.keys) // for Dictionary
        
        componentArray = componentArray.sorted()
        
        var parmaData = ""
        for ca in componentArray {
            parmaData += ca + "=" + extraParam[ca]! + "&"
        }
        return String(parmaData.dropLast())
        
        
    }
    
    fileprivate func getFinalUrl(method:String, endPoint: String, optionalParam:Dictionary<String,String>? = nil)->String{
        let nonce = RandomString.randomString(length: 32)
        let signature_method = "HMAC-SHA256"
        let timestamp = String(Int(NSDate().timeIntervalSince1970))
        //        let optionalParam:Dictionary =  ["per_page":"1","page":"1"]
        let requestURL = self.siteURL + "/wp-json/wc/v2/" + endPoint
        
        let requredParams = ["oauth_consumer_key": self.consumerKey,
                             "oauth_nonce": nonce,
                             "oauth_signature_method": signature_method,
                             "oauth_timestamp" : timestamp] as [String : String]
        
        //        var requestParams = "oauth_consumer_key=" + self.consumerKey
        //        requestParams = requestParams + "&oauth_nonce=" + nonce
        //        requestParams = requestParams + "&oauth_signature_method=" + signature_method
        //        requestParams = requestParams + "&oauth_timestamp=" + String(timestamp)
        //        requestParams = requestParams + "&page=1"
        //        requestParams = requestParams + "&per_page=1"
        //        requestParams = requestParams + "&page=1"
        var requestParams = queryString(extraParam: requredParams)
        if( optionalParam != nil){
            requestParams =  (requestParams + "&" + queryString(extraParam: optionalParam!))
        }
        
        let finalUrl =  requestURL + "?" + requestParams  + "&oauth_signature=" + getPercentEncoding(string: getEncData(requestMethod: method,requestURL: requestURL,requestParams: requestParams  ))
        return finalUrl
    }
    
    fileprivate func hitGet(_ finalUrl: String, method:HTTPMethod, completion: @escaping (_ success: Bool, _ response: JSON?) -> Void) {
        print( " final url :\(finalUrl)")
        Alamofire.request(finalUrl, method: method) .responseJSON { response in
            if response.result.isSuccess {
                let json = response.result.value
                let sJSON = JSON(json as Any)
                completion(true, sJSON )
                
            } else {
                print(response)
                completion(false, nil )
            }
        }
    }
    
    fileprivate func hitPost(_ finalUrl: String,method:String, parameters: Dictionary<String, Any>, completion: @escaping (_ success: Bool, _ response: JSON?) -> Void) {
        print( " final url :\(finalUrl)")
        
        var request = URLRequest(url: URL(string:finalUrl)!)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") 
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters)
        
        
        Alamofire.request(request) .responseJSON { response in
            if response.result.isSuccess {
                let json = response.result.value
                
                let sJSON = JSON(json as Any)
                print(sJSON)
                completion(true, sJSON )
                
            } else {
                print(response)
                completion(false, nil )
            }
        }
    }
    
    
    
    public func getProductsData(endPoint: String, optionalParam:Dictionary<String,String>? = nil) {
        let finalUrl = getFinalUrl(method: "GET", endPoint: endPoint, optionalParam: optionalParam );
        hitGet(finalUrl,method: .get,  completion:{ (success, response) in
            if(success == true && response != nil){
                print(response as Any)
//                let wcProduct = WCProduct(jsonData: response![0])
//                print("product: \(wcProduct)")
            }
        })
        
    }
    public func getOrdersData(endPoint: String){
        let finalUrl = getFinalUrl(method: "GET", endPoint: endPoint);
        hitGet(finalUrl, method: .get, completion:{ (success, response) in
            if(success == true && response != nil){
                let wcProduct = WCOrder(jsonData: response![0])
                print("orders: \(wcProduct)")
            }
        })
    }
    public func createorder(endPoint: String,parameters :Dictionary<String, Any>){
        let finalUrl = getFinalUrl(method: "POST", endPoint: endPoint);
        hitPost(finalUrl, method: "POST", parameters: parameters, completion:{ (success, response) in
            if(success == true && response != nil){
                
            }
        })
    }
    public func updateOrder(endPoint: String,parameters :Dictionary<String, Any>){
        let finalUrl = getFinalUrl(method: "PUT", endPoint: endPoint);
        hitPost(finalUrl, method: "PUT", parameters: parameters, completion:{ (success, response) in
            if(success == true && response != nil){
                
            }
        })
    }
    
    public func deleteAnOrder(endPoint: String){
        let finalUrl = getFinalUrl(method: "DELETE", endPoint: endPoint);
        hitGet(finalUrl, method: .delete, completion:{ (success, response) in
            if(success == true && response != nil){
                print(response as Any)
            }
        })
    }
 }
 
 

