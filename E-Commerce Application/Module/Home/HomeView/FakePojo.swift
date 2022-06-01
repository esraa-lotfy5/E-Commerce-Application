//
//  FakePojo.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 6/1/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
//fake pojo
// MARK: - Welcome
struct Products: Identifiable {
    var id = UUID()
    
    let products: [ProductBrand]
}

// MARK: - Product
struct ProductBrand : Identifiable {
    var id  = UUID()
    let vendor: String
}

//declare dummy array
var productsArr = [ProductBrand(vendor: "Adidas"),
ProductBrand(vendor: "Asics Tiger"),
ProductBrand(vendor: "Converse"),
ProductBrand(vendor: "Dr Martens"),
ProductBrand(vendor: "Flex Fit"),
ProductBrand(vendor: "Herschel"),
ProductBrand(vendor: "Nike"),
ProductBrand(vendor: "Palladuim"),
ProductBrand(vendor: "Puma"),
ProductBrand(vendor: "Supra"),
ProductBrand(vendor: "Timberland"),
ProductBrand(vendor: "Vans")]


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
