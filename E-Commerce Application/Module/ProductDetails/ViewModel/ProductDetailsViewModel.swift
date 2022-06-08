//
//  ProductDetailsViewModel.swift
//  E-Commerce Application
//
//  Created by NourAllah Ahmed on 6/2/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
class ProductDetailsViewModel :BaseAPI<NetworkRequest> , ObservableObject{
    @Published var Products : ProductDetail?
    @Published var productInventoryQuantity : ProductInventoryQuantity?
//    @Publisher var User: currentUser?
    var draftOrder : DraftOrder?
    
    var draftOrderID :Int?
    func getProductDetails(id:String , completion : @escaping (Result <ProductsResults? , NSError>) -> Void){
        self.fetchData(target: .getProductDetials(productID: id), responseClass:
        ProductsResults.self) { (result) in
            self.Products = try? result.get()?.product
            completion(result)
        }
    }
    
    func getProductInventoryQuantity(id:String , completion : @escaping (Result <ProductInventoryQuantity? , NSError>) -> Void){
        self.fetchData(target: .getProductInventoryQuantity(productID: id), responseClass:
                        ProductInventoryQuantity.self) { (result) in
            
            completion(result)
        }
    }
    
    func getCurrentUser(){
        
    }
    
    
    
    
    //TODO: get the orderId and the email of the customer and know if it cart or wishlist
    func getAllDarftOrder(){
        self.fetchData(target: .getDraftOrders , responseClass:
        DraftOrders.self) { (result) in
            print("request \(String(describing: try? result.get()?.draftOrders))")
            try? result.get()?.draftOrders.filter({ DraftOrder in
                if(DraftOrder.email == "nourallahahmed1100@gamil.com"){
                    print(DraftOrder.note ?? "nil")
                    if (DraftOrder.note == "cart"){
                        self.draftOrderID = DraftOrder.id
                        self.draftOrder = DraftOrder
                        
                        
                    }
                }
                return true
            })
        }
    }
    
    
    func updatDraftOrder(lineItem : LineItems ) {
        self.getAllDarftOrder()
        
        draftOrder?.lineItems?.append(lineItem)
        //TODO: change to json
        let jsonEncoder = JSONEncoder()
        guard let jsonData = try? jsonEncoder.encode(draftOrder) else { return  }
         let json = String(data: jsonData , encoding: String.Encoding.utf8)
        print(json as? [String : Any])
        //TODO: change to list of parameters
        guard let jsonToList = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String : Any]
        else { return }
        
        
        if(draftOrderID != nil){
            
            print("request \(String(self.draftOrderID!))")
            self.writeData(target: .updateDraftOrder(draftOrderID: self.draftOrderID!  , parameters: jsonToList), responseClass: DraftOrder.self) { result in
                print(try? result.get()?.lineItems)
            }
        }
    }
    
    
    
    func jsonString(data : Any) -> String {

            var jsonString = "";

            do {

                let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String

            } catch {
                print(error.localizedDescription)
            }

            return jsonString;
    }
}
