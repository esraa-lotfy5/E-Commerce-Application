//
//  RegisterViewModel.swift
//  E-Commerce Application
//
//  Created by Abdelrhman Ahmed on 04/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import Alamofire

class RegisterViewModel: ObservableObject {
    
    private let networkAPI: NetworkAPI = NetworkAPI()
    
    func registerCustomer(customer: Parameters, completion: @escaping(Result<Customer?, NSError>) -> Void) {
        
        networkAPI.registerCustomer(customer: customer) { result in
            
            switch result {
            
            case .success(let response):
                
                if let response = response {

                    let customerDict = response["customer"] as! [String: Any]
                    print("Customer dict: \(customerDict)")

                    let customer = Customer(id: customerDict["id"] as? Int64,first_name: customerDict["first_name"] as? String, last_name: customerDict["last_name"] as? String, email: customerDict["email"] as? String)

                    print("view model response: \(response)")
                    print("view model response: \(response)")
                    print("view model customer: \(customer)")
                    print("view model customer id: \(customer.id ?? 0)")
                    print("view model customer email: \(customer.email ?? "")")
                    completion(.success(customer))
                }
                
            case .failure(let error):
                print("error: \(error.localizedDescription)")
                completion(.failure(error))
            }
            
        }
        
    }
    
}
