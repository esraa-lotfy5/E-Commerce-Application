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
    case getProductInventoryQuantity(productID : String)
    case postDraftOrder
    case getDraftOrders
    case updateDraftOrder (draftOrderID: Int , parameters : Parameters )
    case getCurrentUser

}

extension NetworkRequest : TargetType {
    var baseURL: String {
        switch self {
        default: //9d169ad72dd7620e70f56b28ae6146d9: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
            return "https://@madalex20220.myshopify.com/admin/api/2022-04/"
        }
    }
    
    var path: String {
        switch self {
        case .getCategoryID:
            return "custom_collections.json"
            
        case .getCategoryProduct(let categoryID):
            return "collections/\(categoryID)/products.json"
            
        case .getProductDetials(let productID):
            return "products/\(productID).json"
            
        
        case .getProductInventoryQuantity(productID: let productID):
            return "products/\(productID)/variants/count.json"
            
            
        case .postDraftOrder:
            return "draft_orders.json"
            
        case .getDraftOrders:
            return "draft_orders.json"

        case .updateDraftOrder( draftOrderID: let draftOrderID):
            print("request 33\(draftOrderID)")
            return "draft_orders/872478310539.json"
            
        case .getCurrentUser:
            return "users/current.json"
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

                
        case .getProductInventoryQuantity(productID: let productID):
            return .get
            
        case .postDraftOrder:
            return .post
            
        case .getDraftOrders:
            return .get
            
        case .updateDraftOrder:
            return .put
            
        case .getCurrentUser:
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
        
        case .getProductInventoryQuantity(productID: let productID):
            return .requestPlain

        case .getDraftOrders:
            return .requestPlain
            
        case .postDraftOrder:
            return .requestPlain
        
        case .updateDraftOrder(draftOrderID: let draftOrderID , parameters : let parameters ):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
//            return.requestPlain
        case .getCurrentUser:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {

//        case .getDraftOrders :
//            return [
//                "Content-Type":"application/json",
//                "X-Shopify-Access-Token":"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"
//                ]
        default:

            return [
                "X-Shopify-Access-Token":"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"
            ]
        }
    }
    
    
}
