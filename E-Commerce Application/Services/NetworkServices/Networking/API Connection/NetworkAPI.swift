//
//  NetworkAPI.swift
//  E-Commerce Application
//
//  Created by Aya Abdelraouf on 05/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import Alamofire


protocol NetworkAPIProtocol {
    func postAddress(address: Parameters, completion: @escaping(Result<Addresss?, NSError>) -> Void)

}

class NetworkAPI: BaseAPI<NetworkRequest>, NetworkAPIProtocol {
   
   func postAddress(address: Parameters, completion: @escaping(Result<Addresss?, NSError>) -> Void){
        
        self.writeData(target: .postAddress(address: address), responseClass: Addresss.self) { (result) in
            completion(result)
            
            
    }
    
    
    
}
}
