import Foundation
import ObjectMapper

public struct ProductCategory: Mappable {
    public var id: Int?
    public var name: String?
    public var slug: String?
    public var parent: Int?
    public var description: String?
    public var display: String?
    public var image: NSURL?
    public var count: Int?

    public init?(map: Map) {}

    public init() {}

    mutating public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        slug <- map["slug"]
        parent <- map["parent"]
        description <- map["description"]
        display <- map["display"]
        image <- map["image"]
        count <- map["count"]
    }

    public static func getAll(limit: Int = 10, completion: @escaping (_ success: Bool, _ orders: [ProductCategory]?) -> Void) {
        let client = Client.sharedClient
        client.getArray(type: .ProductCategories, slug: "products/categories", limit: limit, completion: completion)
    }
}
