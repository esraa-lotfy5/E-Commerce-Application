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


class ShoppingCartViewModel : ObservableObject , ShoppingCartProtocol {

  
    var networkApi : NetworkAPI = NetworkAPI()
    @Published var shoppingCartProducts = [DraftOrder]()
    @Published var totalPrice = 0.0
    @Published var subTotalPrice = 0.0
    @Published var totalTax = 0.0

    
    
    
    func getAllDraftOrders(){

        networkApi.getAllDraftOrders { result in
            try? result.get()?.draftOrders.filter({ DraftOrder in

                if(DraftOrder.email == "nourallahahmed1100@gamil.com") //TODO: get the current users email
                {
                    
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
        refreshPage()
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
        print(shoppingCartProducts)
        networkApi.updateDraftOrder(draftOrderID:draftOrderID ,parameter: parameters)
        refreshPage()
        print(shoppingCartProducts)
    }
    func refreshPage(){
        var updateProducts = [DraftOrder]()
        var updateTotalPrice :Double = 0.0
        var updateSubTotalPrice :Double = 0.0
        var updateTotalTax :Double = 0.0

        networkApi.getAllDraftOrders { result in
            try? result.get()?.draftOrders.filter({ DraftOrder in

                if(DraftOrder.email == "nourallahahmed1100@gamil.com") //TODO: get the current users email
                {
                    
                    if (DraftOrder.note == "cart"){
                        
                        updateProducts.append(DraftOrder)
                        print(updateProducts)
                    }
                    updateTotalPrice = updateProducts.reduce(0.0) {

                        partialResult, draftorder in
                        partialResult + Double(draftorder.totalPrice)!
                        
                      }
                    
                    updateSubTotalPrice =  updateProducts.reduce(0.0) {
                        
                        partialResult, draftorder in
                        partialResult + Double(draftorder.subtotalPrice)!
                        
                      }
                    updateTotalTax =  updateProducts.reduce(0.0) {
                        
                        partialResult, draftorder in
                        partialResult + Double(draftorder.totalTax)!
                        
                      }
                }
                print("from refresh after network \(updateProducts)")
                self.shoppingCartProducts = updateProducts
                self.totalTax = updateTotalTax
                self.totalPrice = updateTotalPrice
                self.subTotalPrice = updateSubTotalPrice
                return true
            })
            
            
        }

    }
}
