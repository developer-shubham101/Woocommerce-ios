//
//  WCOrder.swift
//  Woocommerce
//
//  Created by Amit Shukla on 12/03/18.
//  Copyright © 2018 Amit Shukla. All rights reserved.
//

import Foundation
import SwiftyJSON


public struct WCOrder{
    public var id: Int?
    public var orderNumber: Int?
    public var createdAt: NSDate?
    public var updatedAt: NSDate?
    public var completedAt: NSDate?
    public var status: String?
    public var currency: String?
    public var total: Float?
    public var subtotal: Float?
    public var totalLineItemQuantity: Int?
    public var totalTax: Float?
    public var totalShipping: Float?
    public var cartTax: Float?
    public var shippingTax: Float?
    public var totalDiscount: Float?
    public var shippingMethods: String?
    public var paymentDetails: PaymentDetails?
    public var billingAddress: Address?
    public var shippingAddress: Address?
    public var note: String?
    public var customerIp: String?
    public var customerUserAgent: String?
    public var customerId: Int?
    public var viewOrderUrl: NSURL?
    public var lineItems: [LineItem]?
    public var shippingLines: String?
    public var taxLines: String?
    public var feeLines: String?
    public var couponLines: String?
    public var customer_id: Int?
    
   
    init(jsonData: JSON) {
        id = jsonData["id"].int
        orderNumber = jsonData["number"].int
        //createdAt = jsonData["created_at"]
       // updatedAt = jsonData["updated_at"]
        //completedAt = jsonData["completed_at"]
        status = jsonData["status"].stringValue
        currency = jsonData["currency"].stringValue
        total = Float(jsonData["total"].stringValue)
       // subtotal = Float(jsonData["subtotal"].stringValue) //inside line items
        //totalLineItemQuantity = jsonData["total_line_items_quantity"].int //inside line items
        totalTax = Float(jsonData["total_tax"].stringValue)
        totalShipping = Float(jsonData["shipping_total"].stringValue)
        cartTax = Float(jsonData["cart_tax"].stringValue)
        shippingTax = Float(jsonData["shipping_tax"].stringValue)
        totalDiscount = Float(jsonData["discount_total"].stringValue)
        //shippingMethods = jsonData["shipping_methods"].stringValue
       // paymentDetails = jsonData["payment_details"]
        //billingAddress = jsonData["billing"].stringValue
        //shippingAddress = jsonData["shipping"]
        note = jsonData["customer_note"].stringValue
        customerIp = jsonData["customer_ip_address"].stringValue
        customerUserAgent = jsonData["customer_user_agent"].stringValue
        customerId = jsonData["customer_id"].int
        //viewOrderUrl = NSURL(string: jsonData["view_order_url"].stringValue)
       // lineItems = jsonData["line_items"]
        shippingLines = jsonData["shipping_lines"].stringValue //array data
       // lineItems = jsonData["line_items"]
        taxLines = jsonData["tax_lines"].stringValue // array data
        feeLines = jsonData["fee_lines"].stringValue // array data
        couponLines = jsonData["coupon_lines"].stringValue // array data
        customer_id = jsonData["customer_id"].int
    }
    
    public static func get(id: Int, completion: @escaping (_ success: Bool, _ order: Order?) -> Void) {
        let client = Client.sharedClient
        client.get(type: "order", id: id, completion: completion)
    }
}
