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
    
    private let networkAPI: NetworkAPIProtocol = NetworkAPI()
//    @Published var orders: [Order] = []
    private let currEmail = UserDefaults.standard.string(forKey: "email")
    
//    init() {
////        getUserOrders()
//    }
    
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
    
    func getUserOrders(completion: @escaping(Result<[Order]?, NSError>) -> Void) {
        
        var list = [Order]()

        networkAPI.getUserOrders { result in
            
            switch result {
                
            case .success(let response):
                
//                print("orders viewmodel response: \(response?.orders ?? [])")
                
                guard let ordersResponse = response else {
                    print("there is no orders for this user")
                    return
                }
                
                list = ordersResponse.orders.filter {
                    $0.email?.lowercased() == self.currEmail?.lowercased()
                }
//
//                return ordersResponse.orders.filter {
//                    $0.email?.lowercased() == self.currEmail?.lowercased()
//                }
                
                if list.count > 0 {
                    print("there are \(list.count) orders for this user")
                    // append to your list
                    
                } else {
                    print("there is no orders for this user")
                }
                
//                completion(list)
                completion(.success(list))
                
                
//
//                list = ordersResponse.orders.filter {
//                    $0.email?.lowercased() == self.currEmail?.lowercased()
//                }
                
            case .failure(let error):
                print("error: \(error.localizedDescription)")
                completion(.failure(error))
//                completion(error)
                
            }
            
        }
        
//        return list
        
    }
    
    func updateInventoryLevel (inventoryItem : Parameters) {
        
//        var returned : Bool = false
        
        networkAPI.updateInventoryLevel(InventoryItem: inventoryItem) { (result) in
            
            switch result {
            case .success(let response):
                let responseInventoryItem = response
                print("INVENTORY ITEM POSTTTTTTT\(String(describing: responseInventoryItem))")
//                returned = true
                
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
            }
        }
//        return returned

    }
    
}
