//
//  Product.swift
//  E-Commerce Application
//
//  Created by Abdelrhman Ahmed on 31/05/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation

// MARK: - Product
struct ProductsResults: Decodable {
    let product: ProductDetail?
    private enum CodingKeys: String, CodingKey {
        case product = "product"
    }
}

// MARK: - ProductElement
struct ProductDetail: Decodable {
    var id: Int?
    var title:String?
    var  body_html : String?
    var vendor :String?
    var product_type: String?
    var created_at: String?
    var handle: String?
    var updated_at, published_at: String?
//    var template_suffix: JSONNull?
    var status:String?
    var published_scope:String?
    var tags :String?
    var admin_graphql_api_id: String?
    var variants: [Variant]?
    var options: [Option]?
    var images: [ProductImage]?
    var image: ProductImage?

//    enum CodingKeys: String, CodingKey {
//        case id, title
//        case productDescription = "body_html"
//        case vendor
//        case productType = "product_type"
//        case createdAt = "created_at"
//        case handle
//        case updatedAt = "updated_at"
//        case publishedAt = "published_at"
//        case templateSuffix = "template_suffix"
//        case status
//        case publishedScope = "published_scope"
//        case tags
//        case adminGraphqlAPIID = "admin_graphql_api_id"
//        case variants, options, images, image
//    }

}

// MARK: - Image
struct ProductImage: Decodable {
    var product_id, id, position: Int?
    var created_at, updated_at: String?
//    var alt: JSONNull?
    var width, height: Int?
    var src: String?
//    var variantIDS: [JSONAny]
//    var admin_graphql_api_id: String?

//    enum CodingKeys: String, CodingKey {
//        case productID = "product_id"
//        case id, position
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case alt, width, height, src
//        case variantIDS = "variant_ids"
//        case adminGraphqlAPIID = "admin_graphql_api_id"
//    }
//    init(from decoder: Decoder) throws {
//        //
//    }
}

// MARK: - Option
struct Option: Decodable {
    var product_id, id: Int?
    var name: String?
    var position: Int?
    var values: [String]?

//    enum CodingKeys: String, CodingKey {
//        case productID = "product_id"
//        case id, name, position, values
//    }
}

// MARK: - Variant
struct Variant: Decodable {
    var product_id, id: Int?
    var title, price, sku: String?
    var position: Int?
    var inventory_policy: String?
//    var compare_at_price: JSONNull?
    var fulfillment_service, inventory_management, option1, option2: String?
//    var option3: JSONNull?
    var created_at, updated_at: String?
    var taxable: Bool?
//    var barcode: JSONNull?
    var grams: Int?
//    var image_id: JSONNull?
    var weight: Int?
    var weight_unit: String?
    var inventory_item_id, inventory_quantity, old_inventory_quantity: Int?
    var requires_shipping: Bool?
    var admin_graphql_api_id: String?

//    enum CodingKeys: String, CodingKey {
//        case productID = "product_id"
//        case id, title, price, sku, position
//        case inventoryPolicy = "inventory_policy"
//        case compareAtPrice = "compare_at_price"
//        case fulfillmentService = "fulfillment_service"
//        case inventoryManagement = "inventory_management"
//        case option1, option2, option3
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case taxable, barcode, grams
//        case imageID = "image_id"
//        case weight = "weight"
//        case weightUnit = "weight_unit"
//        case inventoryItemID = "inventory_item_id"
//        case inventoryQuantity = "inventory_quantity"
//        case oldInventoryQuantity = "old_inventory_quantity"
//        case requiresShipping = "requires_shipping"
//        case adminGraphqlAPIID = "admin_graphql_api_id"
//    }
}
