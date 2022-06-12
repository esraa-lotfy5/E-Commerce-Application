//
//  SmartCollections.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 10/06/2022.
//  Copyright © 2022 iti. All rights reserved.


import Foundation

struct SmartCollections: Codable {
    let smart_collections: [SmartCollection]

}

struct SmartCollection: Codable {
    let title : String
    let image: ImageBrand
}
//
struct ImageBrand: Codable {
    let src: String
}


struct BrandsArr : Identifiable {
    var id = UUID()
    var brand : [Brand]
}

struct Brand : Identifiable {
    var id = UUID()
    var brandImage : String
    var brandTitle : String
}

