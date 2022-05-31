//
//  Product.swift
//  UITestingSwiftUI
//
//  Created by Esraa Lotfy  on 5/28/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation

struct ProductItem : Identifiable{
    var id : UUID = UUID(),
    image : String,
    name : String,
    Description : String,
    price : String
}
