//
//  Networking.swift
//  E-Commerce Application
//
//  Created by NourAllah Ahmed on 6/3/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkRequest{
    case getCategoryID
    case getCategoryProduct (categoryID : String)
    case getProductDetials(productID : String)
    
    case loginCustomer
    case registerCustomer(customer: Parameters)
    
    case postAddress(address: Parameters, Coustomerid: String)
    case getAddress(coustomerId: String)
}

extension NetworkRequest : TargetType {
    var baseURL: String {
        switch self {
        default: //9d169ad72dd7620e70f56b28ae6146d9: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
//            return "https://@madalex20220.myshopify.com/admin/api/2022-04/"
//            return "https://@madalex20220.myshopify.com/admin/api/2022-01/"
            return Constants.baseUrl
        }
    }
    
    var path: String {
        switch self {
        case .getCategoryID:
            return "custom_collections.json"
            
        case .getCategoryProduct(let categoryID):
            return "collections/\(categoryID)/products.json"
            
        case .getProductDetials(let productID):
            print(productID)
            return "products/\(productID).json"
            
        case .loginCustomer:
            return Constants.endPointLogin
            
        case .registerCustomer:
            return Constants.endPointCreateCustomer
            
        case .postAddress(_,let coustmerId):
            print(coustmerId)
            return "customers/\(coustmerId)/addresses.json"
            
        case.getAddress(let coustomerId):
            return "customers/\(coustomerId)/addresses.json"
        
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
            
        case .loginCustomer:
            return .get
            
        case .registerCustomer:
            return .post
            
        case .postAddress :
            return .post

        case.getAddress :
            return.get

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
            
        case .loginCustomer:
            return .requestPlain
            
        case .registerCustomer(let customer):
            return .requestParameters(parameters: customer, encoding: URLEncoding.default)
            
        case .postAddress(let parameters,_):
            return.requestParameters(parameters: parameters, encoding: URLEncoding.default)
            
        case .getAddress:
            return.requestPlain
            
        }
    }
    
    var headers: [String : String]? {
        switch self {
    
        default:

            return [
                "X-Shopify-Access-Token":"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"
            ]
        }
    }
    
}
