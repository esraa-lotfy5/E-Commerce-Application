//
//  FakePojo.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
//fake pojo
// MARK: - Welcome
struct Products: Identifiable {
    var id = UUID()
    
    let products: [Product]
}

// MARK: - Product
struct Product: Identifiable {
    var id  = UUID()
    let vendor: String
}

//declare dummy array
var productsArr = [Product(vendor: "Adidas"),
Product(vendor: "Asics Tiger"),
Product(vendor: "Converse"),
Product(vendor: "Dr Martens"),
Product(vendor: "Flex Fit"),
Product(vendor: "Herschel"),
Product(vendor: "Nike"),
Product(vendor: "Palladuim"),
Product(vendor: "Puma"),
Product(vendor: "Supra"),
Product(vendor: "Timberland"),
Product(vendor: "Vans")]


struct Sales : Identifiable {
    var id  = UUID()
    var image : String
}

var salesArr = [
Sales(image: "salesOne"),
Sales(image: "salesTwo"),
Sales(image: "salesThree"),
Sales(image: "salesFour"),
Sales(image: "salesFive")
]

