//
//  LoginViewModel.swift
//  E-Commerce Application
//
//  Created by Abdelrhman Ahmed on 06/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import Alamofire

class LoginViewModel: ObservableObject {
    
    private let networkAPI: NetworkAPI = NetworkAPI()
    
    func loginCustomer(completion: @escaping(Result<CustomersResponse?, NSError>) -> Void) {

        networkAPI.loginCustomer { result in
            
            switch result {
                
            case .success(let response):
                
                
//                print("login viewmodel response: \(response)")
                
//                print("login viewmodel first response: \(response?[0].customers)")
                completion(.success(response))
                
            case .failure(let error):
                print("error: \(error.localizedDescription)")
                completion(.failure(error))
                
            }
            
        }
        
    }
    
}
