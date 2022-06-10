//
//  OrdersViewModel.swift
//  E-Commerce Application
//
//  Created by Abdelrhman Ahmed on 08/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import Alamofire

class OrdersViewModel: ObservableObject {
    
    private let networkAPI: NetworkAPI = NetworkAPI()
    
    func createOrder(order: Parameters, completion: @escaping(Result<[String: Any]?, NSError>) -> Void) {

        networkAPI.createOrder(order: order) { result in
            
            switch result {
                
            case .success(let response):
                
                print("orders viewmodel response: \(response)")
                completion(.success(response))
                
            case .failure(let error):
                print("error: \(error.localizedDescription)")
                completion(.failure(error))
                
            }
            
        }
        
    }
    
    func getUserOrders(completion: @escaping(Result<OrdersResponse?, NSError>) -> Void) {

        networkAPI.getUserOrders { result in
            
            switch result {
                
            case .success(let response):
                
                print("login viewmodel response: \(response)")
                completion(.success(response))
                
            case .failure(let error):
                print("error: \(error.localizedDescription)")
                completion(.failure(error))
                
            }
            
        }
        
    }
    
}
