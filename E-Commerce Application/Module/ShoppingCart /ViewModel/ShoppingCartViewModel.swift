//
//  ShoppingCartViewModel.swift
//  E-Commerce Application
//
//  Created by NourAllah Ahmed on 08/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//
import Foundation

protocol ShoppingCartProtocol {
    func getAllDraftOrders()
    func deleteDraftOrder(draftOrderID: Int)
    
}


class ShoppingCartViewModel : ObservableObject , ShoppingCartProtocol{
  
  
    var networkApi : NetworkAPI = NetworkAPI()
    @Published var shoppingCartProducts = [DraftOrder]()
    @Published var totalPrice = 0.0
    @Published var subTotalPrice = 0.0
    @Published var totalTax = 0.0

    
    
    
    func getAllDraftOrders(){
        networkApi.getAllDraftOrders { result in
            print("request \(String(describing: try? result.get()?.draftOrders))")
            try? result.get()?.draftOrders.filter({ DraftOrder in
                if(DraftOrder.email == "nourallahahmed1100@gamil.com") //TODO: get the current users email
                {
                    
                    self.shoppingCartProducts = []
                    if (DraftOrder.note == "cart"){
                        self.shoppingCartProducts.append(DraftOrder)
                    }
                    self.totalPrice =  self.shoppingCartProducts.reduce(0.0) {

                        partialResult, draftorder in
                        partialResult + Double(draftorder.totalPrice)!
                        
                      }
                    
                    self.subTotalPrice =  self.shoppingCartProducts.reduce(0.0) {
                        
                        partialResult, draftorder in
                        partialResult + Double(draftorder.subtotalPrice)!
                        
                      }
                    self.totalTax =  self.shoppingCartProducts.reduce(0.0) {
                        
                        partialResult, draftorder in
                        partialResult + Double(draftorder.totalTax)!
                        
                      }
                }
                return true
            })
        }
    }
    
    func deleteDraftOrder(draftOrderID: Int) {
        networkApi.deleteDraftOrder(draftOrder: draftOrderID)
    }
    
    
    func updateDraftOrder(variantId: Int , quantity : Int, draftOrderID:Int){
        let parameters =     [
            "draft_order": [
                "email" : "nourallahahmed1100@gamil.com",  //TODO: get the current users email
                "note" : "cart",
                "line_items": [[
                    "variant_id": variantId,
                    "quantity":  quantity
                ]]
            ]
        ]
        networkApi.updateDraftOrder(draftOrderID:draftOrderID ,parameter: parameters)
    
    }
    
}
