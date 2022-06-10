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

struct Order: Decodable {
    
    var id: Int64?
    var contact_email: String?
    var created_at: String?
    var currency: String?
    var current_total_price: String?
    var email: String?
    var financial_status: String?
    var gateway: String?
    var order_number: Int?
    var line_items: [LineItems]?
    var shipping_address: ShippingAddress?
    
    
}

struct ShippingAddress: Decodable {
    
    var first_name: String?
    var last_name: String?
    var address1: String?
    var city: String?
    var country: String?
    var name: String?
    
}
