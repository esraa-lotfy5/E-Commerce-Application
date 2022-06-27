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
   // @Published  var comingAddressess :[Addresss] = []
    @Published var defultAddress :Addresss = Addresss(id: 1, address1: "", city: "", country: "")
    private let currId = UserDefaults.standard.integer(forKey: "id")
    
    init() {
       // getAddress()
    }
    
    //5754051854475
    func postApi (address: Parameters){
        api.postAddress( coustmerId: "\(currId)", address: address) {(result) in
            switch result {
            case .success(let response):
                let addressResponse = response
                
//                print("address \(String(describing: addressResponse?.city))")
            case .failure(let error):
                // Show UI Error
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
            }
            
        }
    }
    
    func getAddress(completion: @escaping(Result<[Addresss]?, NSError>) -> Void){
        var list = [Addresss]()
        
        api.getAddress(coustmerId: "\(currId)") {(result) in
            switch result {
            case .success(let response):
               
                
            list = response?.addresses ?? []
//                print(self.comingAddressess)
                completion(.success(list))
                
                //print("address \(String(describing: addressResponse?.city))")
            case .failure(let error):
                // Show UI Error
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
                completion(.failure(error))
            }
            
        }
    }
    
    func createOrder(order: Parameters, completion: @escaping(Result<[String: Any]?, NSError>) -> Void) {

        api.createOrder(order: order) { result in
            
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
    
    func getAllDraftOrders(completion: @escaping(Result<DraftOrders?, NSError>) -> Void) {
        
        var draftOrders = [DraftOrder]()
        
//        print("draft order on address vm: just called")
        
        DispatchQueue.global(qos: .background).async {

            self.api.getAllDraftOrders { [weak self] result in

                completion(result)
                
//                try? result.get()?.draftOrders.filter({ draftOrder in
//
//                    print("draft order on address vm: in result \(draftOrder)")
//
//                    if(draftOrder.email == self?.currEmail ?? "") //TODO: get the current users email
//                    {
//
//                        if (draftOrder.note == "cart"){
//
////                            completion(draftOrder)
//                            draftOrders.append(DraftOrder)
////                            self?.shoppingCartProducts.append(DraftOrder)
//                        }
////                        self?.totalPrice =  self?.shoppingCartProducts.reduce(0.0) {
////
////                            partialResult, draftorder in
////                            partialResult + Double(draftorder.totalPrice)!
////
////                        } ?? 0.0
//
////                        self?.subTotalPrice =  self?.shoppingCartProducts.reduce(0.0) {
////
////                            partialResult, draftorder in
////                            partialResult + Double(draftorder.subtotalPrice)!
////
////                        } ?? 0.0
////                        self?.totalTax =  self?.shoppingCartProducts.reduce(0.0) {
////
////                            partialResult, draftorder in
////                            partialResult + Double(draftorder.totalTax)!
////
////                        } ?? 0.0
//                    }
//                    return true
//                })
            }
        }
        
//        print("draft order on address vm: \(draftOrders)")
//        return draftOrders
    }
    
}
