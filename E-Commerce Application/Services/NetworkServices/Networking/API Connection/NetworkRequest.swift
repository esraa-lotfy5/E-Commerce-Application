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
    
    case getProductInventoryQuantity(productID : String)
    case postDraftOrder( draftOrderID:  Int ,parameters :  Parameters )
    case getDraftOrders
    case updateDraftOrder (draftOrderID: Int , parameters : Parameters )
    case getCurrentUser
    case deleteDraftOrder(darftOrderID:Int)
    
}

extension NetworkRequest : TargetType {
    var baseURL: String {
        switch self {
        default: return Constants.baseUrl
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
            
        case .getProductInventoryQuantity(productID: let productID):
            return "products/\(productID)/variants/count.json"
            
            
        case .postDraftOrder:
            return "draft_orders.json"
            
        case .getDraftOrders:
            return "draft_orders.json"

        case .updateDraftOrder( draftOrderID: let draftOrderID ,parameters : let Parameters ):
            print("request 33  \(draftOrderID)")
            return "draft_orders/\(draftOrderID).json"
            
        case .getCurrentUser:
            return "users/current.json"
        case .deleteDraftOrder(darftOrderID: let draftOrderID):
            return "draft_orders/\(draftOrderID).json"
        
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

        case .deleteDraftOrder(darftOrderID: let darftOrderID):
            return .delete

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
            
        case .getProductInventoryQuantity(productID: let productID):
            return .requestPlain

        case .getDraftOrders:
            return .requestPlain
            
        case .postDraftOrder( draftOrderID: let draftOrderID ,parameters : let Parameters ):
            return .requestParameters(parameters: Parameters, encoding: URLEncoding.default)
        
        case .updateDraftOrder(draftOrderID: let draftOrderID , parameters : let parameters ):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
//            return.requestPlain
        case .getCurrentUser:
            return .requestPlain
        case .deleteDraftOrder(darftOrderID: let darftOrderID):
            return .requestPlain
            
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
