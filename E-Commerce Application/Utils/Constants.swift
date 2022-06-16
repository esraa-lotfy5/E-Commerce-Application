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
    
    static let baseUrlCurrency = "https://api.apilayer.com/exchangerates_data/"
    
    // endpoints
    static let endPointLogin = "customers.json"
    static let endPointCreateCustomer = "customers.json"
    static let endPointOrders = "orders.json"
    static let endpointCurrency = ""
    
}

struct ErrorMessages {
    static let genericError = "Something went wrong!"
    static let statusCode422 = "Error while creating request!"
    static let emailAndPhoneError = "You need to provide untaken email and phone!"
}


//https://api.apilayer.com/exchangerates_data/latest?symbols=EGP,USD,AED,AFN&base=EUR&apikey=SEYGO2EroCLponB3IyndgQQ04a0oN1jl
