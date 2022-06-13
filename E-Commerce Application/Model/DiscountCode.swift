//
//  DiscountCode.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 11/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
//struct DiscountCodes : Codable {
//    var discount_codes: DiscountCode
//}
//
//struct DiscountCode : Codable {
//
//    var id: Int64
//   // var price_rule_id: Int
//  //  var code : String
////    var usage_count : Int64
////    var created_at : String
////    var updated_at : String
//
////
////    "id": 12107289100427,
////    "price_rule_id": 1095463338123,
////    "code": "OPENING45OFF",
////    "usage_count": 0,
////    "created_at": "2022-06-11T15:40:17+02:00",
////    "updated_at": "2022-06-11T15:40:17+02:00"
//
//}
struct DiscountCodes: Codable {
    var discountCodes: [DiscountCode]

    enum CodingKeys: String, CodingKey {
        case discountCodes = "discount_codes"
    }
}

// MARK: - DiscountCode
struct DiscountCode: Codable {
    var id, priceRuleID: Int64
    var code: String
    var usageCount: Int64
    var createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case priceRuleID = "price_rule_id"
        case code
        case usageCount = "usage_count"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
