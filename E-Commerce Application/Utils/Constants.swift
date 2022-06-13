//
//  Constants.swift
//  E-Commerce Application
//
//  Created by Abdelrhman Ahmed on 01/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation

struct Constants {
    
    static let baseUrl = "https://@madalex20220.myshopify.com/admin/api/2022-04/"
    
    // endpoints
    static let endPointLogin = "customers.json"
    static let endPointCreateCustomer = "customers.json"
    
}

struct ErrorMessages {
    static let genericError = "Something went wrong!"
    static let statusCode422 = "Status code is 422"
    static let emailAndPhoneError = "You need to provide untaken email and phone!"
}
