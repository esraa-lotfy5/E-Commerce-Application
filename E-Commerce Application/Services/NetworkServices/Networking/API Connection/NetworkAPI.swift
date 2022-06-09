//
//  NetworkAPI.swift
//  E-Commerce Application
//
//  Created by NourAllah Ahmed on 08/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import Alamofire


protocol NetworkAPIProtocol {
    func getAllDraftOrders(completion: @escaping(Result<DraftOrders?, NSError>) -> Void)
    func deleteDraftOrder(draftOrder:Int)
    func postDraftOrder(parameter: Parameters)
    func getProductDetails(id:String , completion : @escaping (Result <ProductsResults? , NSError>) -> Void)
    func getProductInventoryQuantity(id:String , completion : @escaping (Result <ProductInventoryQuantity? , NSError>) -> Void)
}

class NetworkAPI: BaseAPI<NetworkRequest>, NetworkAPIProtocol {
    func getProductInventoryQuantity(id: String, completion: @escaping (Result<ProductInventoryQuantity?, NSError>) -> Void) {
        self.fetchData(target: .getProductInventoryQuantity(productID: id), responseClass:
                        ProductInventoryQuantity.self) { (result) in
            
            completion(result)
        }
    }
    
    func getProductDetails(id: String, completion: @escaping (Result<ProductsResults?, NSError>) -> Void) {
        self.fetchData(target: .getProductDetials(productID: id), responseClass:
        ProductsResults.self) { (result) in
            completion(result)
        }
    }
    
    func postDraftOrder(parameter: Parameters) {
        self.writeData(target: .
                       postDraftOrder(parameters: parameter), responseClass: DraftOrder.self) { result in
            
        }
    }
    
    func deleteDraftOrder(draftOrder: Int) {
        self.fetchData(target: .deleteDraftOrder(darftOrderID: draftOrder) , responseClass:
        DraftOrders.self) { (result) in
            print(result)
            
        }
    }
    
    func getAllDraftOrders(completion: @escaping (Result<DraftOrders?, NSError>) -> Void) {
            self.fetchData(target: .getDraftOrders , responseClass:
            DraftOrders.self) { (result) in
                completion(result)
            }
        }
    
    

}
