//
//  ShoppingCartViewModel.swift
//  E-Commerce Application
//
//  Created by NourAllah Ahmed on 08/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//
import Foundation
import UIKit

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
    

    private let currEmail = UserDefaults.standard.string(forKey: "email")
//    
//    func getTotalPrice() -> Double{
//        
//        self.getAllDraftOrders()
//        
//        return totalPrice
//        
//    }
    
    func getAllDraftOrders() {
        print(self.currEmail)

        DispatchQueue.global(qos: .background).async {

            self.networkApi.getAllDraftOrders { [weak self] result in
                try? result.get()?.draftOrders.filter({ DraftOrder in
                    print(DraftOrder.email)
                    print(self?.currEmail )
                    if(DraftOrder.email == self?.currEmail ?? "iosteam@gmail.com") //TODO: get the current users email
                    {
                        
                        if (DraftOrder.note == "cart"){
                            
                            self?.shoppingCartProducts.append(DraftOrder)
                        }
                        self?.totalPrice =  self?.shoppingCartProducts.reduce(0.0) {

                            partialResult, draftorder in
                            partialResult + Double(draftorder.totalPrice)!
                            
                        } ?? 0.0
                        
                        self?.subTotalPrice =  self?.shoppingCartProducts.reduce(0.0) {
                            
                            partialResult, draftorder in
                            partialResult + Double(draftorder.subtotalPrice)!
                            
                        } ?? 0.0
                        self?.totalTax =  self?.shoppingCartProducts.reduce(0.0) {
                            
                            partialResult, draftorder in
                            partialResult + Double(draftorder.totalTax)!
                            
                        } ?? 0.0
                    }
                    return true
                })
            }
        }
    }
    
    func deleteDraftOrder(draftOrderID: Int) {
        DispatchQueue.global(qos: .background).async {

            self.networkApi.deleteDraftOrder(draftOrder: draftOrderID)
            DispatchQueue.main.async {
                self.refreshPage()

            }
            
        }
    }
    func deleteAllDraftOrder() {
        
        for i in shoppingCartProducts{
            DispatchQueue.global(qos: .background).async {

                self.networkApi.deleteDraftOrder(draftOrder: i.id ?? 0)
               
            }
        }
       
    }
    
    func updateDraftOrder(variantId: Int , quantity : Int, draftOrderID:Int){
        let parameters =     [
            "draft_order": [
                "email" : currEmail ?? "",  //TODO: get the current users email
                "note" : "cart",
                "line_items": [[
                    "variant_id": variantId,
                    "quantity":  quantity
                ]]
            ]
        ]
        DispatchQueue.global(qos: .background).async { 

            self.networkApi.updateDraftOrder(draftOrderID:draftOrderID ,parameter: parameters)
            DispatchQueue.main.async {
                self.refreshPage()

            }
        }
    }
    func refreshPage(){
        var updateProducts = [DraftOrder]()
        var updateTotalPrice :Double = 0.0
        var updateSubTotalPrice :Double = 0.0
        var updateTotalTax :Double = 0.0
        DispatchQueue.global(qos: .background).async {

            self.networkApi.getAllDraftOrders { [weak self] result in
            try? result.get()?.draftOrders.filter({ DraftOrder in

                if(DraftOrder.email == self?.currEmail ?? "") //TODO: get the current users email
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
            
                self?.shoppingCartProducts = updateProducts
                self?.totalTax = updateTotalTax
                self?.totalPrice = updateTotalPrice
                self?.subTotalPrice = updateSubTotalPrice
                return true
            })
            
            
        }
        }

    }
}
