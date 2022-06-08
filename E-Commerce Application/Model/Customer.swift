//
//  Customer.swift
//  E-Commerce Application
//
//  Created by Abdelrhman Ahmed on 04/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation

struct Customer: Decodable {
    
    var id: Int64?
    var first_name: String?
    var last_name: String?
    var email: String?
    var phone: String?
    var tags: String?
    var password: String?
    var password_confirmation: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case first_name
        case last_name
        case email
        case phone
        case tags
        case password
        case password_confirmation
    }
    
}

struct CustomerResponse: Decodable {
    
    var customer: Customer
    
    enum CodingKeys: String, CodingKey {
        case customer
    }
    
}

struct CustomersResponse: Decodable {
    
    var customers: [Customer]
    
    enum CodingKeys: String, CodingKey {
        case customers
    }
    
}
