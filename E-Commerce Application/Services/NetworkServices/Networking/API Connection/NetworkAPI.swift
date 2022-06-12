//
//  NetworkAPI.swift
//  E-Commerce Application
//
//  Created by Abdelrhman Ahmed on 04/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkAPIProtocol {
    func loginCustomer(completion: @escaping(Result<CustomersResponse?, NSError>) -> Void)
    func registerCustomer(customer: Parameters, completion: @escaping(Result<[String: Any]?, NSError>) -> Void)
    
    func postAddress(coustmerId : String,address: Parameters, completion: @escaping(Result<Addresss?, NSError>) -> Void)
    func getAddress(coustmerId :String, completion: @escaping(Result<AllAddress?, NSError>) -> Void)
    
    func getAllDraftOrders(completion: @escaping(Result<DraftOrders?, NSError>) -> Void)
    func deleteDraftOrder(draftOrder:Int)
    func postDraftOrder(parameter: Parameters)
    func getProductDetails(id:String , completion : @escaping (Result <ProductsResults? , NSError>) -> Void)
    func getProductInventoryQuantity(id:String , completion : @escaping (Result <ProductInventoryQuantity? , NSError>) -> Void)
    func getCategoryProducts(parameters : [String:String], completion: @escaping(Result<CategoryProducts?, NSError>) -> Void)
}

class NetworkAPI: BaseAPI<NetworkRequest>, NetworkAPIProtocol {
    func getProductDetails(id: String, completion: @escaping (Result<ProductsResults?, NSError>) -> Void) {
        self.fetchData(target: .getProductDetials(productID: id), responseClass:
        ProductsResults.self) { (result) in
            completion(result)
        }
    }
    func getProductInventoryQuantity(id: String, completion: @escaping (Result<ProductInventoryQuantity?, NSError>) -> Void) {
        self.fetchData(target: .getProductInventoryQuantity(productID: id), responseClass:
                        ProductInventoryQuantity.self) { (result) in
            
            completion(result)
        }
    }
    
    func loginCustomer(completion: @escaping (Result<CustomersResponse?, NSError>) -> Void) {
        self.fetchData(target: .loginCustomer, responseClass: CustomersResponse.self) { (result) in
            completion(result)
        }
    }
    
    func registerCustomer(customer: Parameters, completion: @escaping(Result<[String: Any]?, NSError>) -> Void){
        self.writeData(target: .registerCustomer(customer: customer), responseClass: [String: Any].self) { (result) in
            completion(result)
        }
    }
    
    func postAddress(coustmerId : String,address: Parameters, completion: @escaping(Result<Addresss?, NSError>) -> Void){
            
       self.writeData(target: .postAddress(address: address, Coustomerid: coustmerId), responseClass: Addresss.self) { (result) in
            completion(result)
            
       }
    }
    
    func getAddress(coustmerId :String, completion: @escaping(Result<AllAddress?, NSError>) -> Void){
        self.fetchData(target: .getAddress(coustomerId: coustmerId), responseClass: AllAddress.self){(result) in
            completion(result)
        }
    }
    
    func deleteDraftOrder(draftOrder: Int) {
        self.fetchData(target: .deleteDraftOrder(darftOrderID: draftOrder) , responseClass: DraftOrders.self) { (result) in
            print(result)
            
        }
    }

    func getAllDraftOrders(completion: @escaping (Result<DraftOrders?, NSError>) -> Void) {
        self.fetchData(target: .getDraftOrders , responseClass:
        DraftOrders.self) { (result) in
            completion(result)
        }
    }

    func postDraftOrder(parameter: Parameters) {
        self.writeData(target: .
            postDraftOrder(parameters: parameter), responseClass: DraftOrder.self) { result in
            
        }
    }
    
    func getCategoryProducts(parameters :[String:String], completion: @escaping(Result<CategoryProducts?, NSError>) -> Void){
        self.fetchData(target: .getCategoryProductsWithBrandName(parameters: parameters), responseClass: CategoryProducts.self){(result) in
            completion(result)
        }
    }
    
//    func deleteDraftOrder(draftOrder: Int) {
//        self.fetchData(target: .deleteDraftOrder(darftOrderID: draftOrder) , responseClass:
//        DraftOrders.self) { (result) in
//            print(result)
//
//        }
//    }
  
    
}
