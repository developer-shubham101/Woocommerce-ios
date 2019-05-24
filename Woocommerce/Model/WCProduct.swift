import Foundation
import SwiftyJSON

public struct WCProduct {
    public var name: String?
    public var id: String?
    public var createdAt: NSDate?
    public var updatedAt: NSDate?
    public var type: String?
    public var status: String?
    public var downloadable: Bool?
    public var virtual: Bool?
    public var permalink: NSURL?
    public var sku: String?
    public var price: Float?
    public var regularPrice: Float?
    public var salePrice: Float?
    public var salePriceDatesFrom: NSDate?
    public var salePriceDatesTo: NSDate?
    public var priceHtml: String?
    public var taxable: Bool?
    public var taxStatus: String?
    public var taxClass: String?
    public var managingStock: Bool?
    public var stockQuantity: Int?
    public var inStock: Bool?
    public var backordersAllowed: Bool?
    public var backordered: Bool?
    public var backorders: String?
    public var soldIndividually: Bool?
    public var purchaseable: Bool?
    public var featured: Bool?
    public var visible: Bool?
    public var catalogVisibility: String?
    public var onSale: Bool?
    public var weight: String?
    public var dimensions: String?
    public var shippingRequired: Bool?
    public var shippingTaxable: Bool?
    public var shippingClass: String?
    public var shippingClassId: Int?
    public var description: String?
    public var enableHtmlDescription: Bool?
    public var shortDescription: String?
    public var enableHtmlShortDescription: Bool?
    public var reviewsAllowed: Bool?
    public var averageRating: String?
    public var ratingCount: Int?
    public var relatedIds: String?
    public var upsellIds: String?
    public var crossSellIds: String?
    public var parentId: Int?
    var categories = [Categories]()
    public var tags: String?
    public var images: String?
    public var featuredSrc: String?
    var attributes = [AttributesModel]()
    public var defaultAttributes: String?
    public var downloads: String?
    public var downloadLimit: Int?
    public var downloadExpiry: Int?
    public var downloadType: String?
    public var purchaseNote: String?
    public var totalSales: Int?
    public var variations: [JSON]?
    public var parent: String?
    public var productUrl: NSURL?
    public var buttonText: String?
    public var menuOrder: Int?
    
    init(jsonData: JSON) {
        
        id = jsonData["id"].stringValue
        name = jsonData["name"].stringValue
        //createdAt = converToDate(stringDate: jsonData["date_created"].stringValue)
        //updatedAt <- map["updated_at"]
        type = jsonData["type"].stringValue
        status = jsonData["status"].stringValue
        downloadable = jsonData["downloadable"].boolValue
        virtual = jsonData["virtual"].boolValue
        permalink = NSURL(string: jsonData["permalink"].stringValue)
        sku = jsonData["sku"].stringValue
        price = Float(jsonData["price"].stringValue)
        regularPrice = Float(jsonData["regular_price"].stringValue)
        salePrice = Float(jsonData["sale_price"].stringValue)
        //salePriceDatesFrom <- map["sale_price_dates_from"]
        //salePriceDatesTo <- map["sale_price_dates_to"]
        priceHtml = jsonData["price_html"].stringValue
        //taxable <- map["taxable"]
        taxStatus = jsonData["tax_status"].stringValue
        taxClass = jsonData["tax_class"].stringValue
        managingStock = jsonData["manage_stock"].boolValue
        stockQuantity = jsonData["stock_quantity"].intValue
        inStock = jsonData["in_stock"].boolValue
        backordersAllowed = jsonData["backorders_allowed"].boolValue
        backordered = jsonData["backordered"].boolValue
        backorders = jsonData["backorders"].stringValue
        soldIndividually = jsonData["sold_individually"].boolValue
        purchaseable = jsonData["purchasable"].boolValue
        featured = jsonData["featured"].boolValue
        //visible <- map["visible"]
        catalogVisibility = jsonData["catalog_visibility"].stringValue
        onSale = jsonData["on_sale"].boolValue
        weight = jsonData["weight"].stringValue
    //dimensions = jsonData["dimensions"]
        shippingRequired = jsonData["shipping_required"].boolValue
        shippingTaxable = jsonData["shipping_taxable"].boolValue
        shippingClass = jsonData["shipping_class"].stringValue
        shippingClassId = jsonData["shipping_class_id"].intValue
        description = jsonData["description"].stringValue
        //enableHtmlDescription <- map["enable_html_description"]
        shortDescription = jsonData["short_description"].stringValue
        //enableHtmlShortDescription <- map["enable_html_short_description"]
        reviewsAllowed = jsonData["reviews_allowed"].boolValue
        averageRating = jsonData["average_rating"].stringValue
        ratingCount = jsonData["rating_count"].intValue
    //relatedIds = jsonData["related_ids"]
    //upsellIds = jsonData["upsell_ids"]
    //crossSellIds = jsonData["cross_sell_ids"]
        parentId = jsonData["parent_id"].intValue
    let categoriesvalue = jsonData["categories"].array
        if categoriesvalue != nil{
            for cat in categoriesvalue!{
                categories.append(Categories(id: cat["id"].intValue, name: cat["name"].stringValue, slug: cat["slug"].stringValue ))
            }
        }
        
    //tags = jsonData["tags"]
    //images = jsonData["images"]
        //featuredSrc = jsonData["featured_src"]
    let attributesValue = jsonData["attributes"].array
        if attributesValue != nil{
            for at in attributesValue!{
                attributes.append(AttributesModel(options:at["options"].array!, id: at["id"].intValue, name: at["name"].stringValue, position: at["position"].intValue, visible: at["visible"].boolValue, variation: at["variation"].boolValue ))
            }
        }
    //defaultAttributes = jsonData["default_attributes"]
    //downloads = jsonData["downloads"]
        downloadLimit = jsonData["download_limit"].intValue
        downloadExpiry = jsonData["download_expiry"].intValue
       // downloadType = jsonData["download_type"]
        purchaseNote = jsonData["purchase_note"].stringValue
        totalSales = jsonData["total_sales"].intValue
        variations = jsonData["variations"].array
       // parent = jsonData["parent"]
        //productUrl = jsonData["product_url"]
        buttonText = jsonData["button_text"].stringValue
        menuOrder = jsonData["menu_order"].intValue
    }
    
    func converToDate(stringDate:String)->NSDate{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return (dateFormatter.date(from: stringDate) as NSDate?)!
    }
    
}
