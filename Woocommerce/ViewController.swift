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

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let orderData = ["payment_method": "bacs",
                         "payment_method_title": "Direct Bank Transfer",
                         "set_paid": true,
                         "billing": [
                            "first_name": "Shubham",
                            "last_name": "Sharma",
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
                            "first_name": "Shubham",
                            "last_name": "Sharma",
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
                                "quantity": 4
                            ]
            ]] as [String : Any]
        
        Service.sharedClient.getProductsData(endPoint: "products",optionalParam: ["per_page":"1","page":"1"])
//        Service.sharedClient.createorder(endPoint: "orders", parameters: orderData )
//        Service.sharedClient.updateOrder(endPoint: "orders/2589", parameters: orderData )
//        Service.sharedClient.deleteAnOrder(endPoint: "orders/2588")
//        Service.sharedClient.getOrdersData(endPoint: "orders")
        
        
    }
    
    
    
    
}

