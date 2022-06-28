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
    case getCategoryProductsWithBrandName(parameters : Parameters)
//    case getCategoryProduct (categoryID : String)
    case getProductDetials(productID : String)
    
    case loginCustomer
    case registerCustomer(customer: Parameters)
    
    case postAddress(address: Parameters, Coustomerid: String)
    case getAddress(coustomerId: String)
    
    case getProductInventoryQuantity(productID : String)
    case getDraftOrders
    case getCurrentUser
    case deleteDraftOrder(darftOrderID:Int)
        case postDraftOrder( parameters :  Parameters )
        case updateDraftOrder (draftOrderID: Int , parameters : Parameters )
    case getSmartCollections
    //trial coupon
    case getPriceRule
    case postPriceRule(priceRule : Parameters)
    case postDiscountCode (dicountCode: Parameters,discountId: String)
    
    case getDiscountCode (discountId : String)
    
    case createOrder(order: Parameters)
    case getUserOrders
    
    case updatedCurrency (baseLg : String)
    case updateInventoryLevel  (inventoryLevel : Parameters)
}

extension NetworkRequest : TargetType {
    var baseURL: String {
        switch self {
         
        case .updatedCurrency :
            return Constants.baseUrlCurrency
            
        default : return Constants.baseUrl
        }
    }
    
    var path: String {
        switch self {
        case .getCategoryProductsWithBrandName(let parameters):
            return "products.json"
            
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
            return "draft_orders.json?limit=250"

        case .updateDraftOrder( draftOrderID: let draftOrderID ,parameters : let Parameters ):
            return "draft_orders/\(draftOrderID).json"
            
        case .getCurrentUser:
            return "users/current.json"
        case .deleteDraftOrder(darftOrderID: let draftOrderID):
            return "draft_orders/\(draftOrderID).json"
            
        case .getSmartCollections:
            return "smart_collections.json"
            
            //trial
        case .getPriceRule:
            return "price_rules.json"
            
        case .postPriceRule (let priceRule):
            return "price_rules.json"

        case .postDiscountCode (_ , let discountId):
            return "price_rules/\(discountId)/discount_codes.json"
            
        case .getDiscountCode(discountId: let discountCode):
            return "price_rules/\(discountCode)/discount_codes.json"
            
        case .createOrder:
            return Constants.endPointOrders
            
        case .getUserOrders:
            return Constants.endPointOrders
          
        case.updatedCurrency(let base):
            return "latest?symbols=EGP,USD,AED,AFN&base=\(base)&apikey=ORyl7lm1qahH8H4EFcRlFeFoV0d9HciN"
            
        case .updateInventoryLevel( let inventoryLevel):
            return "inventory_levels/adjust.json"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getCategoryProductsWithBrandName:
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
            
        case .getSmartCollections:
            return .get

            //trial
        case .getPriceRule:
            return .get
        case .postPriceRule:
            return .post

        case .postDiscountCode:
            return .post
            
        case .getDiscountCode(discountId: _):
            return .get
            
        case .createOrder:
            return .post
            
        case .getUserOrders:
            return .get
            
        case.updatedCurrency:
            return .get
            
        case .updateInventoryLevel:
            return .post

        }
    }
    
    var task: Task {
        switch self {
            
        case .getCategoryProductsWithBrandName(let parameters):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
            
//        case .getCategoryProduct:
//            return .requestPlain
            
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
            
        case .postDraftOrder( parameters :  let Parameters ):

            return .requestParameters(parameters: Parameters, encoding: URLEncoding.default)
        
        case .updateDraftOrder(draftOrderID: let draftOrderID , parameters : let parameters ):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
//            return.requestPlain
        case .getCurrentUser:
            return .requestPlain
        case .deleteDraftOrder(darftOrderID: let darftOrderID):
            return .requestPlain
            
        case .getSmartCollections :
            return .requestPlain
            //trial
        case .getPriceRule:
            return .requestPlain
        case .postPriceRule (let priceRule):
            return .requestParameters(parameters: priceRule, encoding: URLEncoding.default)
            

        case .postDiscountCode(let parameters , _):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
            
        case .getDiscountCode(discountId: _):
            return .requestPlain
            
        case .createOrder(let order):
            return .requestParameters(parameters: order, encoding: URLEncoding.default)
            
        case .getUserOrders:
            return .requestPlain
            
        case .updatedCurrency:
            return .requestPlain
            
        case .updateInventoryLevel(let inventoryLevel ):
            return .requestParameters(parameters: inventoryLevel, encoding: URLEncoding.default)
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
