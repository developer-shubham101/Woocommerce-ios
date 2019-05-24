import Foundation
import ObjectMapper

public struct Product: Mappable {
    public var title: String?
    public var id: Int?
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
    public var categories: String?
    public var tags: String?
    public var images: String?
    public var featuredSrc: String?
    public var attributes: String?
    public var defaultAttributes: String?
    public var downloads: String?
    public var downloadLimit: Int?
    public var downloadExpiry: Int?
    public var downloadType: String?
    public var purchaseNote: String?
    public var totalSales: Int?
    public var variations: String?
    public var parent: String?
    public var productUrl: NSURL?
    public var buttonText: String?
    public var menuOrder: Int?

    public init?(map: Map) {}

    mutating public func mapping(map: Map) {
        title <- map["title"]
        id <- map["id"]
        createdAt <- map["created_at"]
        updatedAt <- map["updated_at"]
        type <- map["type"]
        status <- map["status"]
        downloadable <- map["downloadable"]
        virtual <- map["virtual"]
        permalink <- map["permalink"]
        sku <- map["sku"]
        price <- (map["price"], FloatTransform())
        regularPrice <- (map["regular_price"], FloatTransform())
        salePrice <- (map["sale_price"], FloatTransform())
        salePriceDatesFrom <- map["sale_price_dates_from"]
        salePriceDatesTo <- map["sale_price_dates_to"]
        priceHtml <- map["price_html"]
        taxable <- map["taxable"]
        taxStatus <- map["tax_status"]
        taxClass <- map["tax_class"]
        managingStock <- map["managing_stock"]
        stockQuantity <- map["stock_quantity"]
        inStock <- map["in_stock"]
        backordersAllowed <- map["backorders_allowed"]
        backordered <- map["backordered"]
        backorders <- map["backorders"]
        soldIndividually <- map["sold_individually"]
        purchaseable <- map["purchaseable"]
        featured <- map["featured"]
        visible <- map["visible"]
        catalogVisibility <- map["catalog_visibility"]
        onSale <- map["on_sale"]
        weight <- map["weight"]
        dimensions <- map["dimensions"]
        shippingRequired <- map["shipping_required"]
        shippingTaxable <- map["shipping_taxable"]
        shippingClass <- map["shipping_class"]
        shippingClassId <- map["shipping_class_id"]
        description <- map["description"]
        enableHtmlDescription <- map["enable_html_description"]
        shortDescription <- map["short_description"]
        enableHtmlShortDescription <- map["enable_html_short_description"]
        reviewsAllowed <- map["reviews_allowed"]
        averageRating <- map["average_rating"]
        ratingCount <- map["rating_count"]
        relatedIds <- map["related_ids"]
        upsellIds <- map["upsell_ids"]
        crossSellIds <- map["cross_sell_ids"]
        parentId <- map["parent_id"]
        categories <- map["categories"]
        tags <- map["tags"]
        images <- map["images"]
        featuredSrc <- map["featured_src"]
        attributes <- map["attributes"]
        defaultAttributes <- map["default_attributes"]
        downloads <- map["downloads"]
        downloadLimit <- map["download_limit"]
        downloadExpiry <- map["download_expiry"]
        downloadType <- map["download_type"]
        purchaseNote <- map["purchase_note"]
        totalSales <- map["total_sales"]
        variations <- map["variations"]
        parent <- map["parent"]
        productUrl <- map["product_url"]
        buttonText <- map["button_text"]
        menuOrder <- map["menu_order"]
    }

    public static func get(id: Int, completion: @escaping (_ success: Bool, _ product: Product?) -> Void) {
        let client = Client.sharedClient
        client.get(type: "product", id: id, completion: completion)
    }

    public static func getAll(byCategory category: ProductCategory, limit: Int = 10, completion: @escaping (_ success: Bool, _ orders: [Product]?) -> Void) {
        let client = Client.sharedClient
        guard let slug = category.slug else { return }
        client.getArray(type: .Products, slug: "products?filter[limit]=\(limit)?filter[category]=\(slug)", limit: limit, completion: completion)
    }
}
