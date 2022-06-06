//
//  AddressViewModel.swift
//  E-Commerce Application
//
//  Created by Aya Abdelraouf on 05/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import Alamofire



class AddressViewModel:ObservableObject{
    
    var api :NetworkAPIProtocol = NetworkAPI()
    
    
   
    
    func postApi (address: Parameters){
        api.postAddress( coustmerId: "5753763004555", address: address) {(result) in
        switch result {
        case .success(let response):
            let addressResponse = response
    
            print("address \(String(describing: addressResponse?.city))")
        case .failure(let error):
            // Show UI Error
            print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
        }
        
    }
    }
    
    
}
