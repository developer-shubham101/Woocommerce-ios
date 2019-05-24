import Alamofire
import Foundation
import ObjectMapper

public class Client {
    public static let sharedClient = Client()

    public var consumerKey: String?
    public var consumerSecret: String?
    public var siteURL: String?

    init() {
        self.siteURL =  ""
        self.consumerKey = ""
        self.consumerSecret = ""
        
    }

    init(siteURL: String, consumerKey: String, consumerSecret: String) {
        self.siteURL = siteURL
        self.consumerKey = consumerKey
        self.consumerSecret = consumerSecret
    }

    public func get<T: Mappable>(type: String, id: Int, completion: @escaping (_ success: Bool, _ value: T?) -> Void) {
        let baseURL = NSURL(string: siteURL!)
        let requestURL = NSURL(string : "\(describing: baseURL)/wc-api/v3/\(type)s/\(id)"  )
        let requestURLString = requestURL?.absoluteString

        guard let user = consumerKey, let password = consumerSecret else {
            completion(false, nil)
            return
        }

        Alamofire.request( requestURLString!,method:.get)
            .authenticate(user: user, password: password)
            .responseJSON { response in
                if response.result.isSuccess {
                    print(response.result.value)
//                    let object = Mapper<T>().map(response.result.value! [type])
//                    completion(success: true, value: object)
                } else {
                    completion(false, nil)
                }
        }
    }

    public func getArray<T: Mappable>(type: RequestType, slug: String, limit: Int = 10, completion: @escaping (_ success: Bool, _ value: [T]?) -> Void) {
        guard let url = siteURL, let user = consumerKey, let password = consumerSecret else {
            completion(false, nil)
            return
        }

        let baseURL = NSURL(string: url)
        let baseUrl:String = baseURL!.absoluteString!;

        let requestURL = NSURL(  string : "\(baseUrl)/wc-api/v3/\(slug)?filter[limit]=\(limit)" )
        let requestURLString = requestURL?.absoluteString

        print(requestURLString)
        Alamofire.request( requestURLString! ,method:.get)
            
            .authenticate(user: user, password: password)
            .responseJSON { response in
                if response.result.isSuccess {
                    print(response.result.value)
//                    let objects = Mapper<T>().mapArray(response.result.value![type.rawValue])!
//                    completion(success: true, value: objects)
                } else {
                     print(response)
                    completion(false, nil)
                }
        }
    }
}
