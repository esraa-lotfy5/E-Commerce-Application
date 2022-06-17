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
    @Published var orders: [Order] = []
    private let currEmail = UserDefaults.standard.string(forKey: "email")
    
    init() {
        getUserOrders()
    }
    
    func createOrder(order: Parameters, completion: @escaping(Result<[String: Any]?, NSError>) -> Void) {

        networkAPI.createOrder(order: order) { result in
            
            switch result {
            
            case .success(let response):
                
//                print("orders viewmodel response: \(response ?? [:])")
                completion(.success(response))
                
            case .failure(let error):
//                print("error: \(error.localizedDescription)")
                completion(.failure(error))
                
            }
            
        }
        
    }
    
    func getUserOrders() {

        networkAPI.getUserOrders { result in
            
            switch result {
                
            case .success(let response):
                
//                print("orders viewmodel response: \(response?.orders ?? [])")
                
                guard let ordersResponse = response else {
                    print("there is no orders for this user")
                    return
                }
                
                self.orders = ordersResponse.orders.filter {
                    $0.email?.lowercased() == self.currEmail?.lowercased()
                }
                
                if self.orders.count > 0 {
                    print("there are \(self.orders.count) orders for this user")
                    // append to your list
                    
                } else {
                    print("there is no orders for this user")
                }
                
            case .failure(let error):
                print("error: \(error.localizedDescription)")
                
            }
            
        }
        
    }
    
}
