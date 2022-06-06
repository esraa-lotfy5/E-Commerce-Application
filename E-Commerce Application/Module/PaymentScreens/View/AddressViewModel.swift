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
    @Published  var comingAddressess :[Addresss] = []
    
    init() {
        getAddress()
    }
   
    
    func postApi (address: Parameters){
        api.postAddress( coustmerId: "5754051854475", address: address) {(result) in
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
    
    func getAddress(){
        api.getAddress(coustmerId: "5754051854475") {(result) in
            switch result {
            case .success(let response):
                let addressResponse = response
                
                self.comingAddressess = addressResponse?.addresses ?? []
                print(self.comingAddressess)
                for address in addressResponse?.addresses ?? [] {
                    
                    print("addresss : \(address.address1)")
                }
        
                //print("address \(String(describing: addressResponse?.city))")
            case .failure(let error):
                // Show UI Error
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
            }
            
        }
    }
    
    
}
