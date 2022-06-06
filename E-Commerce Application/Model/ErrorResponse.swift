//
//  ErrorResponse.swift
//  E-Commerce Application
//
//  Created by Abdelrhman Ahmed on 06/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation

struct CustomerError {
    
    var password_confirmation: [String]
    var email: [String]
    var phone: [String]
    
}

struct CustomerErrorResponse: Error {
    
    var errors: CustomerError
    
}
