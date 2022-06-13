//
//  CategoryProducts1.swift
//  E-Commerce Application
//
//  Created by Esraa Lotfy  on 10/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
// MARK: - CategoryProducts
class CategoryProducts: Codable {
    let products: [CategoryProduct]

    init(products: [CategoryProduct]) {
        self.products = products
    }
}

// MARK: - Product
class CategoryProduct: Codable, Identifiable {
    let id: Int64
//    let title , bodyHTM: String
    let title, vendor, productType: String
//    let createdAt: String
//    let handle: String
//    let updatedAt, publishedAt: String
//    let templateSuffix: JSONNull?
//    let status, publishedScope, tags, adminGraphqlAPIID: String
    let status, tags , publishedScope: String
    let variants: [CategoryVariant]
    //let options: [CategoryOption]
    let images: [CategoryImage]

    enum CodingKeys: String, CodingKey {
        case id, title
//        case bodyHTML = "body_html"
        case vendor
        case productType = "product_type"
//        case createdAt = "created_at"
//        case handle
//        case updatedAt = "updated_at"
//        case publishedAt = "published_at"
//        case templateSuffix = "template_suffix"
        case status
        case publishedScope = "published_scope"
        case tags
//        case adminGraphqlAPIID = "admin_graphql_api_id"
//        case variants, options, images
        case variants, images
    }

//    init(id: Int64, title: String, bodyHTML: String, vendor: String, productType: String, createdAt: String, handle: String, updatedAt: String, publishedAt: String, templateSuffix: JSONNull?, status: String, publishedScope: String, tags: String, adminGraphqlAPIID: String, variants: [CategoryVariant], options: [CategoryOption], images: [CategoryImage]) {
    init(id: Int64, title: String, vendor: String, productType: String,publishedScope: String, status: String, tags: String, variants: [CategoryVariant], images: [CategoryImage]){
        self.id = id
        self.title = title
//        self.bodyHTML = bodyHTML
        self.vendor = vendor
        self.productType = productType
//        self.createdAt = createdAt
//        self.handle = handle
//        self.updatedAt = updatedAt
//        self.publishedAt = publishedAt
//        self.templateSuffix = templateSuffix
        self.status = status
        self.publishedScope = publishedScope
        self.tags = tags
//        self.adminGraphqlAPIID = adminGraphqlAPIID
        self.variants = variants
//        self.options = options
        self.images = images
    }
}

// MARK: - Image
class CategoryImage: Codable {
//    let id, productID, position: Int64
//    let createdAt, updatedAt: String
//    let alt: JSONNull?
//    let width, height: Int
    let src: String
//    let variantIDS: [JSONAny]
//    let adminGraphqlAPIID: String

//    enum CodingKeys: String, CodingKey {
//        case id
//        case productID = "product_id"
//        case position
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case alt, width, height, src
//        case variantIDS = "variant_ids"
//        case adminGraphqlAPIID = "admin_graphql_api_id"
//    }
    
    init(src: String){
        self.src = src
    }

//    init(id: Int64, productID: Int64, position: Int64, createdAt: String, updatedAt: String, alt: JSONNull?, width: Int, height: Int, src: String, variantIDS: [JSONAny], adminGraphqlAPIID: String) {
//        self.id = id
//        self.productID = productID
//        self.position = position
//        self.createdAt = createdAt
//        self.updatedAt = updatedAt
//        self.alt = alt
//        self.width = width
//        self.height = height
//        self.src = src
//        self.variantIDS = variantIDS
//        self.adminGraphqlAPIID = adminGraphqlAPIID
//    }
}

// MARK: - Option
//class CategoryOption: Codable {
//    let id, productID: Int64
//    let name: String
//    let position: Int
//    let values: [String]
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case productID = "product_id"
//        case name, position, values
//    }
//
//    init(id: Int64, productID: Int64, name: String, position: Int, values: [String]) {
//        self.id = id
//        self.productID = productID
//        self.name = name
//        self.position = position
//        self.values = values
//    }
//}

// MARK: - Variant
class CategoryVariant: Codable {
//    let id, productID: Int64
    let price :String
//    let , title, sku: String
//    let position: Int
//    let inventoryPolicy: String
//    let compareAtPrice: JSONNull?
//    let fulfillmentService, inventoryManagement, option1, option2: String
//    let option3: JSONNull?
//    let createdAt, updatedAt: String
//    let taxable: Bool
//    let barcode: JSONNull?
//    let grams: Int
//    let imageID: JSONNull?
//    let weight: Int
//    let weightUnit: String
//    let inventoryItemID, inventoryQuantity, oldInventoryQuantity: Int
//    let requiresShipping: Bool
//    let adminGraphqlAPIID: String

//    enum CodingKeys: String, CodingKey {
//        case id
//        case productID = "product_id"
//        case title, price, sku, position
//        case inventoryPolicy = "inventory_policy"
//        case compareAtPrice = "compare_at_price"
//        case fulfillmentService = "fulfillment_service"
//        case inventoryManagement = "inventory_management"
//        case option1, option2, option3
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case taxable, barcode, grams
//        case imageID = "image_id"
//        case weight
//        case weightUnit = "weight_unit"
//        case inventoryItemID = "inventory_item_id"
//        case inventoryQuantity = "inventory_quantity"
//        case oldInventoryQuantity = "old_inventory_quantity"
//        case requiresShipping = "requires_shipping"
//        case adminGraphqlAPIID = "admin_graphql_api_id"
//    }
    
    init(price : String){
        self.price = price
    }

//    init(id: Int64, productID: Int64, title: String, price: String, sku: String, position: Int, inventoryPolicy: String, compareAtPrice: JSONNull?, fulfillmentService: String, inventoryManagement: String, option1: String, option2: String, option3: JSONNull?, createdAt: String, updatedAt: String, taxable: Bool, barcode: JSONNull?, grams: Int, imageID: JSONNull?, weight: Int, weightUnit: String, inventoryItemID: Int, inventoryQuantity: Int, oldInventoryQuantity: Int, requiresShipping: Bool, adminGraphqlAPIID: String) {
//        self.id = id
//        self.productID = productID
//        self.title = title
//        self.price = price
//        self.sku = sku
//        self.position = position
//        self.inventoryPolicy = inventoryPolicy
//        self.compareAtPrice = compareAtPrice
//        self.fulfillmentService = fulfillmentService
//        self.inventoryManagement = inventoryManagement
//        self.option1 = option1
//        self.option2 = option2
//        self.option3 = option3
//        self.createdAt = createdAt
//        self.updatedAt = updatedAt
//        self.taxable = taxable
//        self.barcode = barcode
//        self.grams = grams
//        self.imageID = imageID
//        self.weight = weight
//        self.weightUnit = weightUnit
//        self.inventoryItemID = inventoryItemID
//        self.inventoryQuantity = inventoryQuantity
//        self.oldInventoryQuantity = oldInventoryQuantity
//        self.requiresShipping = requiresShipping
//        self.adminGraphqlAPIID = adminGraphqlAPIID
//    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
