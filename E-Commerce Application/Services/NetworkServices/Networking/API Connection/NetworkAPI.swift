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
    
//    func getAllDraftOrders(completion: @escaping(Result<DraftOrders?, NSError>) -> Void)
//    func deleteDraftOrder(draftOrder:Int)
}

class NetworkAPI: BaseAPI<NetworkRequest>, NetworkAPIProtocol {
    
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
    
//    func deleteDraftOrder(draftOrder: Int) {
//        self.fetchData(target: .deleteDraftOrder(darftOrderID: draftOrder) , responseClass: DraftOrders.self) { (result) in
//            print(result)
//            
//        }
//    }
//
//    func getAllDraftOrders(completion: @escaping (Result<DraftOrders?, NSError>) -> Void) {
//        self.fetchData(target: .getDraftOrders , responseClass:
//        DraftOrders.self) { (result) in
//            completion(result)
//        }
//    }

}
