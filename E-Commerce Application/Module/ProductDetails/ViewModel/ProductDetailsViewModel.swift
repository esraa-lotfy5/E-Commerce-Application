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
                if(DraftOrder.email == "nourallahahmed1100@gamil.com") //TODO: get the current users email
                {
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

    
//    func updatDraftOrder(lineItem : LineItems ){
//        self.getAllDarftOrder()
//        
//        draftOrder?.lineItems?.append(lineItem)
//        //TODO: change to json
//        let jsonEncoder = JSONEncoder()
//        guard let jsonData = try? jsonEncoder.encode(draftOrder) else { return  }
//         let json = String(data: jsonData , encoding: String.Encoding.utf8)
//        //TODO: change to list of parameters
//        guard let jsonToList = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String : Any]
//        else { return }
//        print("Json Formatter \(jsonToList)")
//
//        if(draftOrderID != nil){
//
//            print("request \(String(self.draftOrderID!))")
//            self.writeData(target: .updateDraftOrder(draftOrderID: self.draftOrderID!  , parameters: jsonToList), responseClass: DraftOrder.self) { result in
//                print(try? result.get()?.lineItems)
//            }
//        }
//    }
//    
    
    func postDraftOrder(variantId: Int , quantity : Int){
        self.getAllDarftOrder()
        let parameters =     [
            "draft_order": [
                "email" : "nourallahahmed1100@gamil.com",  //TODO: get the current users email
                "note" : "cart",
                "note_attributes": [
                    ["name": "image","value":Products?.image?.src ?? "default"]
                        ]
                ,
                "line_items": [
                    "variant_id": variantId,
                    "quantity": quantity
                ]
            ]
        ]
        
        
        
        if(draftOrderID != nil){

            print("request \(String(self.draftOrderID!))")
            self.writeData(target: .postDraftOrder(draftOrderID: self.draftOrderID!  , parameters: parameters), responseClass: DraftOrder.self) { result in
                print(try? result.get()?.lineItems)
            }
        }
        
                
}



}
