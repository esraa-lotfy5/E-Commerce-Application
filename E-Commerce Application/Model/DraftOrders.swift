//
//  DraftOrder.swift
//  E-Commerce Application
//
//  Created by NourAllah Ahmed on 07/06/2022.
//  Copyright © 2022 iti. All rights reserved.
// DraftOrder model

import Foundation

struct DraftOrders : Decodable {
    let draftOrders: [DraftOrder]
    
    private enum CodingKeys: String, CodingKey {
        case draftOrders = "draft_orders"
    }

}

struct DraftOrders2 : Decodable {
    let draftOrder: DraftOrder
    
    private enum CodingKeys: String, CodingKey {
        case draftOrder = "draft_order"
    }

}

struct DraftOrder : Decodable , Identifiable , Hashable{
    

    static func == (lhs: DraftOrder, rhs: DraftOrder) -> Bool {
        return lhs.adminGraphqlApiId == rhs.adminGraphqlApiId && lhs.adminGraphqlApiId == rhs.adminGraphqlApiId
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(adminGraphqlApiId)
        hasher.combine(adminGraphqlApiId)
    }


        let id: Int?
        let note: String?
        let email: String?
        let taxesIncluded: Bool?
        let currency: String?
//        let invoiceSentAt: Any
//        let createdAt: String
//        let updatedAt: String
//        let taxExempt: Bool
//        let completedAt: Any
        let name: String?
        let status: String?
        var lineItems: [LineItems]?
//        let shippingAddress: Any
//        let billingAddress: Any
//        let invoiceUrl: String
//        let appliedDiscount: Any
//        let orderId: Int
//        let shippingLine: Any
//        let taxLines: [TaxLines]
        let tags: String?
        let noteAttributes: [NoteAttributes]?
        let totalPrice: String
        let subtotalPrice: String
        let totalTax: String
//        let paymentTerms: Any
        let adminGraphqlApiId: String?
//        let customer: Customer
        private enum CodingKeys: String, CodingKey {
            case id = "id"
            case note = "note"
            case email = "email"
            case taxesIncluded = "taxes_included"
            case currency = "currency"
//            case invoiceSentAt = "invoice_sent_at"
//            case createdAt = "created_at"
//            case updatedAt = "updated_at"
//            case taxExempt = "tax_exempt"
//            case completedAt = "completed_at"
            case name = "name"
            case status = "status"
            case lineItems = "line_items"
//            case shippingAddress = "shipping_address"
//            case billingAddress = "billing_address"
//            case invoiceUrl = "invoice_url"
//            case appliedDiscount = "applied_discount"
//            case orderId = "order_id"
//            case shippingLine = "shipping_line"
//            case taxLines = "tax_lines"
            case tags = "tags"
            case noteAttributes = "note_attributes"
            case totalPrice = "total_price"
            case subtotalPrice = "subtotal_price"
            case totalTax = "total_tax"
//            case paymentTerms = "payment_terms"
            case adminGraphqlApiId = "admin_graphql_api_id"
//            case customer = "customer"
        }

}




struct LineItems: Decodable {

    var id: Int?
    var variantId: Int?
    var productId: Int?
    var quantity: Int?
    var name: String?
    var sku: String?
    var vendor: String?
    var price: String?
    var adminGraphqlApiId: String?
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case variantId = "variant_id"
        case productId = "product_id"
        case quantity = "quantity"
        case sku = "sku"
        case vendor = "vendor"
        case name = "name"
        case price = "price"
        case adminGraphqlApiId = "admin_graphql_api_id"
    }
    


}





struct TaxLines: Decodable {

    let rate: Double
    let title: String
    let price: String

    private enum CodingKeys: String, CodingKey {
        case rate = "rate"
        case title = "title"
        case price = "price"
    }
}

struct NoteAttributes: Decodable {

    let name: String
    let value: String

    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
    }
}
//struct Customer: Decodable {
//
//    let id: Int
//    let email: String
//    let acceptsMarketing: Bool
//    let createdAt: String
//    let updatedAt: String
//    let firstName: String
//    let lastName: String
//    let ordersCount: Int
//    let state: String
//    let totalSpent: String
//    let lastOrderId: Int
//    let note: String
//    let verifiedEmail: Bool
////    let multipassIdentifier: Any
//    let taxExempt: Bool
//    let phone: String
//    let tags: String
////    let lastOrderName: Any
//    let currency: String
//    let acceptsMarketingUpdatedAt: String
////    let marketingOptInLevel: Any
////    let taxExemptions: [Any]
//    let adminGraphqlApiId: String
////    let defaultAddress: DefaultAddress
//    private enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case email = "email"
//        case acceptsMarketing = "accepts_marketing"
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case ordersCount = "orders_count"
//        case state = "state"
//        case totalSpent = "total_spent"
//        case lastOrderId = "last_order_id"
//        case note = "note"
//        case verifiedEmail = "verified_email"
//        case taxExempt = "tax_exempt"
//        case phone = "phone"
//        case tags = "tags"
//        case currency = "currency"
//        case acceptsMarketingUpdatedAt = "accepts_marketing_updated_at"
//        case adminGraphqlApiId = "admin_graphql_api_id"
//    }
//    
//}


//
//struct DefaultAddress: Codable {
//
//    let id: Int
//    let customerId: Int
//    let firstName: String
//    let lastName: String
//    let company: Any
//    let address1: String
//    let address2: Any
//    let city: String
//    let province: String
//    let country: String
//    let zip: String
//    let phone: String
//    let name: String
//    let provinceCode: Any
//    let countryCode: String
//    let countryName: String
//    let defaultField: Bool
//
//    private enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case customerId = "customer_id"
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case company = "company"
//        case address1 = "address1"
//        case address2 = "address2"
//        case city = "city"
//        case province = "province"
//        case country = "country"
//        case zip = "zip"
//        case phone = "phone"
//        case name = "name"
//        case provinceCode = "province_code"
//        case countryCode = "country_code"
//        case countryName = "country_name"
//        case defaultField = "default"
//    }
//}
/*
 "draft_order": {
        "email" : "nourallahahmed1100@gamil.com",
        "note" : "cart",
        "note_attributes": [
        {"name": "image","value":"https://cdn.shopify.com/s/files/1/0589/7509/2875/products/85cc58608bf138a50036bcfe86a3a362.jpg?v=1653403067"}
        ],
        "line_items": [{
            "variant_id": 40335555395723,
            "quantity": 3
        }]
    }
 */
