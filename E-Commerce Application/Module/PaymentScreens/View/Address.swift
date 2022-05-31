//
//  Address.swift
//  E-Commerce Application
//
//  Created by Aya Abdelraouf on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation


struct Address :Identifiable{
    var id :Int
    var name :String
    var address :String
    var city :String
    var zipCode :Int
    var state : String
    var defultShippingAddress :Bool
    
}
