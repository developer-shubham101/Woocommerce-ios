//
//  ViewController.swift
//  Woocommerce
//
//  Created by Amit Shukla on 06/03/18.
//  Copyright © 2018 Amit Shukla. All rights reserved.
//

import UIKit
import OAuthSwift
import CryptoSwift //https://github.com/krzyzanowskim/CryptoSwift#calculate-digest


import Alamofire
extension Data {
    struct HexEncodingOptions: OptionSet {
        let rawValue: Int
        static let upperCase = HexEncodingOptions(rawValue: 1 << 0)
    }
    
    func hexEncodedString(options: HexEncodingOptions = []) -> String {
        let format = options.contains(.upperCase) ? "%02hhX" : "%02hhx"
        return map { String(format: format, $0) }.joined()
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        Service.sharedClient.getProductsData(endPoint: "products",optionalParam: ["per_page":"1","page":"1"])
        let orderData = ["payment_method": "bacs",
                         "payment_method_title": "Direct Bank Transfer",
                         "set_paid": true,
                         "billing": [
                            "first_name": "John",
                            "last_name": "Doe",
                            "address_1": "969 Market",
                            "address_2": "",
                            "city": "San Francisco",
                            "state": "CA",
                            "postcode": "94103",
                            "country": "US",
                            "email": "john.doe@example.com",
                            "phone": "(555) 555-5555"
            ],
                         "shipping": [
                            "first_name": "John",
                            "last_name": "Doe",
                            "address_1": "969 Market",
                            "address_2": "",
                            "city": "San Francisco",
                            "state": "CA",
                            "postcode": "94103",
                            "country": "US"
            ],
                         "line_items": [
                            [
                                "product_id": 2488,
                                "quantity": 2
                            ]
            ]] as Parameters
        
        Service.sharedClient.createorder(endPoint: "orders", parameters: orderData )
        //        Service.sharedClient.getOrdersData(endPoint: "orders")
        
        /*
         
         let consumerKey =    "ck_b255d748344eb0347f89943542ed1c6e54ff4908"
         let consumerSecret = "cs_db6b829e4595839b3e1cd112dea0f903395d7f71"
         
         let nonce = RandomString.randomString(length: 32)
         let signature_method = "HMAC-SHA256"
         let timestamp = Int(NSDate().timeIntervalSince1970)
         
         let wirkingUrl     = "http://sample.racysharma.com/wp-json/wc/v2/products?oauth_consumer_key=\(consumerKey)&oauth_nonce=\(nonce)&oauth_signature_method=\(signature_method)&oauth_timestamp=\(timestamp)"
         
         let siteDomain = "http://sample.racysharma.com/wp-json/wc/v2/products"
         let wirkingUrlData = "oauth_consumer_key=\(consumerKey)&oauth_nonce=\(nonce)&oauth_signature_method=\(signature_method)&oauth_timestamp=\(timestamp)"
         
         
         
         let customAllowedSet =  NSCharacterSet(charactersIn:"=:\"#&%/<>?@\\^`{|}").inverted
         let wirkingUrlEscaped  = (wirkingUrl).addingPercentEncoding(withAllowedCharacters:customAllowedSet)
         
         
         do {
         let readyToEnc = ("GET&" + siteDomain.addingPercentEncoding(withAllowedCharacters:customAllowedSet)! + "&" +  wirkingUrlData.addingPercentEncoding(withAllowedCharacters:customAllowedSet)!)
         let key = consumerSecret + "&"
         let x = try HMAC(key: key, variant: .sha256).authenticate((readyToEnc.bytes))
         print(x.toBase64() as Any)
         
         let finalUrl = wirkingUrl + "&oauth_signature="+x.toBase64()!.addingPercentEncoding(withAllowedCharacters:customAllowedSet)!
         print( finalUrl)
         Alamofire.request(  finalUrl,method:.get)
         
         
         .responseJSON { response in
         if response.result.isSuccess {
         print(response.result.value as Any)
         
         } else {
         print(response)
         
         }
         }
         }catch {
         
         }
         */
        
        
        
        //         print(encod?.base64Encoded())
        //        let iv = Array(Data()!)
        
        //        let myData = encod!.data(using: String.Encoding.utf8)!
        //         print(  String(data: myData , encoding: .utf8) )
        //        let data = Data(bytes: Array(encod!.utf8))
        //        print(data.hexEncodedString()) // 00017f80ff
        //        print(data.hexEncodedString(options: .upperCase)) // 00017F80FF
        
        
        
        
        
        
        
        
        
        //        let audioData = NSData(base64EncodedString: myData, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)
        
        
        
        
        //        let data = Data(bytes: "shubham".bytes)
        
        //        let hash = data.md5()
        //        let hash = data.HmacSHA256().toHexString()
        
        //        print("hash \("shubham".sha256)")
        
        //        let hash = data.sha224()
        //        let hash = data.sha256()
        //        let hash = data.sha384()
        //        let hash = data.sha512()
        
        // create an instance and retain it
        //        let oauthswift = OAuth1Swift(
        //            consumerKey:    "ck_b255d748344eb0347f89943542ed1c6e54ff4908",
        //            consumerSecret: "cs_db6b829e4595839b3e1cd112dea0f903395d7f71"
        //        )
        //        // do your HTTP request without authorize
        //        oauthswift.client.get("http://sample.racysharma.com/wp-json/wc/v2/coupons/",  success: { response in
        //            print(response)
        //        }, failure: { error in
        //            print(error)
        //        })
        
        // authorize
        //        let handle = oauthswift.authorize(
        //            withCallbackURL: URL(string: "http://sample.racysharma.com/wc-api/v3/products")!,
        //            success: { credential, response, parameters in
        //                print(credential.oauthToken)
        //                print(credential.oauthTokenSecret)
        //                print(parameters["user_id"])
        //                // Do your request
        //        },
        //            failure: { error in
        //                print(error.localizedDescription)
        //        }
        //        )
        
        //        Client.init(siteURL: "http://sample.racysharma.com", consumerKey: "ck_b255d748344eb0347f89943542ed1c6e54ff4908", consumerSecret: "cs_db6b829e4595839b3e1cd112dea0f903395d7f71")
        //
        //        ProductCategory.getAll { ( success: Bool, _ orders: [ProductCategory]? ) in
        //            print(success)
        //            print(orders)
        //            //asdas
        //        }
    }
    
    
    
    
}

