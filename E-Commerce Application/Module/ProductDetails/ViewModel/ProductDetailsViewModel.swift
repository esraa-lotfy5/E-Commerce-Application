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
    var networkapi : NetworkAPI = NetworkAPI()
    var draftOrder : DraftOrder?
    
    var draftOrderID :Int?
    func getProductDetails(id:String , completion : @escaping (Result <ProductsResults? , NSError>) -> Void){
        networkapi.getProductDetails(id: id) { (result) in
            self.Products = try? result.get()?.product
        }
    }
    
    
    
    
    
    
    func getProductInventoryQuantity(id:String , completion : @escaping (Result <ProductInventoryQuantity? , NSError>) -> Void){
        networkapi.getProductInventoryQuantity(id: id) { (result) in
            self.productInventoryQuantity = try? result.get()
            print("fquantity: \(self.productInventoryQuantity?.count)")
        }
    }
    

    
    //TODO: get the orderId and the email of the customer and know if it cart or wishlist
    func getAllDarftOrder(){
        self.fetchData(target: .getDraftOrders , responseClass:
        DraftOrders.self) { (result) in
//            print("request \(String(describing: try? result.get()?.draftOrders))")
            try? result.get()?.draftOrders.filter({ DraftOrder in
                if(DraftOrder.email == "nourallahahmed1100@gamil.com") //TODO: get the current users email
                {
//                    print(DraftOrder.note ?? "nil")

                    if (DraftOrder.note == "cart"){
                        self.draftOrderID = DraftOrder.id
                        self.draftOrder = DraftOrder
                        
                        
                    }
                }
                return true
            })
        }
    }

    
    func postDraftOrder(variantId: Int , quantity : Int){
        let parameters =     [
            "draft_order": [
                "email" : "nourallahahmed1100@gamil.com",  //TODO: get the current users email
                "note" : "cart",
                "note_attributes": [
                    ["name": "image","value":Products?.image?.src ?? "default"]
                        ]
                ,
                "line_items": [[
                    "variant_id": variantId,
                    "quantity":  quantity
                ]]
            ]
        ]
        networkapi.postDraftOrder(parameter: parameters)
        
                
}



}
