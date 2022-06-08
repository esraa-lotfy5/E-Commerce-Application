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
    func createOrder(order: Parameters, completion: @escaping(Result<[String: Any]?, NSError>) -> Void)
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
    
    func createOrder(order: Parameters, completion: @escaping (Result<[String : Any]?, NSError>) -> Void) {
        self.writeData(target: .createOrder(order: order), responseClass: [String: Any].self) { (result) in
            completion(result)
        }
    }

}
