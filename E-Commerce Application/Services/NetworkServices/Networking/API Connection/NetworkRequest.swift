//
//  Networking.swift
//  E-Commerce Application
//
//  Created by NourAllah Ahmed on 6/3/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation

enum NetworkRequest{
    case getCategoryID
    case getCategoryProduct (categoryID : String)
    case getProductDetials(productID : String)

}

extension NetworkRequest : TargetType {
    var baseURL: String {
        switch self {
        default:
            return "https://9d169ad72dd7620e70f56b28ae6146d9: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@madalex20220.myshopify.com/admin/api/2022-01"
        }
    }
    
    var path: String {
        switch self {
        
            
            
        case .getCategoryID:
            return "custom_collections.json"
            
        case .getCategoryProduct(let categoryID):
            return "collections/\(categoryID)/products.json"
            
        case .getProductDetials(let productID):
            return "/products/\(productID).json"
            
       
        
        }
    }
    
    var method: HTTPMethod {
        switch self {
            
        case .getCategoryID:
            return .get
            
        case .getCategoryProduct:
            return .get
            
        case .getProductDetials:
            return .get
        }
    }
    
    var task: Task {
        switch self {
            
        case .getCategoryID:
            return .requestPlain
            
        case .getCategoryProduct:
            return .requestPlain
            
        case .getProductDetials:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
    
        default:
            return [:]
        }
    }
    
    
}
