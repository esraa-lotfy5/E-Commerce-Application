//
//  NetworkAPI.swift
//  E-Commerce Application
//
//  Created by NourAllah Ahmed on 08/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import Alamofire


protocol NetworkAPIProtocol {
    func getAllDraftOrders(completion: @escaping(Result<DraftOrders?, NSError>) -> Void)
    func deleteDraftOrder(draftOrder:Int)

}

class NetworkAPI: BaseAPI<NetworkRequest>, NetworkAPIProtocol {
    func deleteDraftOrder(draftOrder: Int) {
        self.fetchData(target: .deleteDraftOrder(darftOrderID: draftOrder) , responseClass:
        DraftOrders.self) { (result) in
            print(result)
            
        }
    }
    
    func getAllDraftOrders(completion: @escaping (Result<DraftOrders?, NSError>) -> Void) {
            self.fetchData(target: .getDraftOrders , responseClass:
            DraftOrders.self) { (result) in
                completion(result)
            }
        }
    
    

}
