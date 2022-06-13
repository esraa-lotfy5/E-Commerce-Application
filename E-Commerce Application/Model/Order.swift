//
//  Order.swift
//  E-Commerce Application
//
//  Created by Abdelrhman Ahmed on 10/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation

struct OrdersResponse: Decodable {
    
    var orders: [Order]
    
}

struct Order: Decodable, Identifiable {
    
    // tems[ name, price,  ], shipping_address{ address1, city, country }
    
    var id: Int64?
//    var contact_email: String?
    var created_at: String?
    var currency: String?
    var total_line_items_price: String?
//    var current_total_price: String?
    var email: String?
    var financial_status: String?
//    var gateway: String?
    var order_number: Int?
    var line_items: [OrderLineItems]?
    var shipping_address: ShippingAddress?
    // var total_price_usd: String?
    
}

struct OrderLineItems: Decodable, Identifiable {
    
    var id: Int64
    var name: String?
    var price: String?
    var quantity: Int?
    
}

struct ShippingAddress: Decodable {
    
//    var first_name: String?
//    var last_name: String?
    var address1: String?
    var city: String?
    var country: String?
//    var name: String?
    
}

