//
//  ShoppingCartViewModel.swift
//  E-Commerce Application
//
//  Created by NourAllah Ahmed on 08/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//
import Foundation
import UIKit
import Network

protocol ShoppingCartProtocol {
    func getAllDraftOrders()
    func deleteDraftOrder(draftOrderID: Int)
    
}


class ShoppingCartViewModel : ObservableObject , ShoppingCartProtocol {

  
    var networkApi : NetworkAPI = NetworkAPI()
    @Published var shoppingCartProducts = [DraftOrder]()
    @Published var totalPrice : Float = 0.0
    @Published var subTotalPrice : Float = 0.0
    @Published var totalTax :Float = 0.0
    @Published var discount  : Float = 0.0

    //Internet
    @Published var NetworkState : Bool = true

    let queue = DispatchQueue(label: "InternetConnectionMonitor")
    let monitor = NWPathMonitor()
    
    private let currEmail = UserDefaults.standard.string(forKey: "email")
    init(){
        self.getAllDraftOrders()
    }
    
    func calcTotal(){
        self.totalPrice =  self.shoppingCartProducts.reduce(0.0) {
            
            partialResult, draftorder in
            partialResult + Float(draftorder.totalPrice)!
            
        } ?? 0.0
        
        self.subTotalPrice =  self.shoppingCartProducts.reduce(0.0) {
            
            partialResult, draftorder in
            partialResult + Float(draftorder.subtotalPrice)!
            
        } ?? 0.0
        self.totalTax =  self.shoppingCartProducts.reduce(0.0) {
            
            partialResult, draftorder in
            partialResult + Float(draftorder.totalTax)!
        } ?? 0.0
    }
    func getAllDraftOrders() {
        monitor.pathUpdateHandler = { [weak self] pathUpdateHandler  in
            print( "network \(pathUpdateHandler.status)")
            if pathUpdateHandler.status == .satisfied {
                DispatchQueue.main.sync {
//                    self?.shoppingCartProducts = []
                    self?.NetworkState = true
                }
                print("ENtered")
                self?.networkApi.getAllDraftOrders { [weak self] result in
//                    self?.shoppingCartProducts = []
                    try? result.get()?.draftOrders.filter({ DraftOrder in
                        
                        if(DraftOrder.email == self?.currEmail ?? "") //TODO: get the current users email
                        {
//                            print("enter")
//                            print(self?.currEmail)
//                            print(DraftOrder.note)
                            if (DraftOrder.note == "cart"){
                                
                                self?.shoppingCartProducts.append(DraftOrder)
                                print(DraftOrder)
                            }
                            self?.totalPrice =  self?.shoppingCartProducts.reduce(0.0) {
                                
                                partialResult, draftorder in
                                partialResult + Float(draftorder.totalPrice)!
                                
                            } ?? 0.0
                            
                            self?.subTotalPrice =  self?.shoppingCartProducts.reduce(0.0) {
                            
                            partialResult, draftorder in
                            partialResult + Float(draftorder.subtotalPrice)!
                            
                        } ?? 0.0
                        self?.totalTax =  self?.shoppingCartProducts.reduce(0.0) {
                            
                            partialResult, draftorder in
                            partialResult + Float(draftorder.totalTax)!
                        } ?? 0.0
                    }
                    return true
                })
            }
            }else{
                DispatchQueue.main.sync {
                    self?.NetworkState = false
                    self?.shoppingCartProducts = []

                }
            }
        }
        monitor.start(queue: queue)
        
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
        DispatchQueue.global(qos: .background).sync {

            self.networkApi.updateDraftOrder(draftOrderID:draftOrderID ,parameter: parameters)
            
//            DispatchQueue.main.async {
                self.refreshPage()

//            }
        }
    }
    func refreshPage(){
        var updateProducts = [DraftOrder]()
        var updateTotalPrice :Float = 0.0
        var updateSubTotalPrice :Float = 0.0
        var updateTotalTax :Float = 0.0
//        self.getAllDraftOrders()
        DispatchQueue.global(qos: .background).async {

            self.networkApi.getAllDraftOrders { [weak self] result in
            try? result.get()?.draftOrders.filter({ DraftOrder in

                if(DraftOrder.email == self?.currEmail ?? "") //TODO: get the current users email
                {

                    if (DraftOrder.note == "cart"){
                        print(DraftOrder.lineItems?.first?.quantity)
                        updateProducts.append(DraftOrder)
                    }
                    updateTotalPrice = updateProducts.reduce(0.0) {

                        partialResult, draftorder in
                        partialResult + Float(draftorder.totalPrice)!

                      }

                    updateSubTotalPrice =  updateProducts.reduce(0.0) {

                        partialResult, draftorder in
                        partialResult + Float(draftorder.subtotalPrice)!

                      }
                    updateTotalTax =  updateProducts.reduce(0.0) {

                        partialResult, draftorder in
                        partialResult + Float(draftorder.totalTax)!

                      }
                }

                self?.shoppingCartProducts = updateProducts
                self?.totalTax = updateTotalTax
                self?.totalPrice = updateTotalPrice + (self?.discount ?? 0.0    )
                self?.subTotalPrice = updateSubTotalPrice
                return true
            })}
        }}
    
    
    
    func refreshPage2() async {
        var updateProducts = [DraftOrder]()
        var updateTotalPrice :Float = 0.0
        var updateSubTotalPrice :Float = 0.0
        var updateTotalTax :Float = 0.0
//        self.getAllDraftOrders()
//        DispatchQueue.global(qos: .background).async {
            self.networkApi.getAllDraftOrders { [weak self] result in
            try? result.get()?.draftOrders.filter({ DraftOrder in

                if(DraftOrder.email == self?.currEmail ?? "") //TODO: get the current users email
                {

                    if (DraftOrder.note == "cart"){
                        print(DraftOrder.lineItems?.first?.quantity)
                        updateProducts.append(DraftOrder)
                    }
                    updateTotalPrice = updateProducts.reduce(0.0) {

                        partialResult, draftorder in
                        partialResult + Float(draftorder.totalPrice)!

                      }

                    updateSubTotalPrice =  updateProducts.reduce(0.0) {

                        partialResult, draftorder in
                        partialResult + Float(draftorder.subtotalPrice)!

                      }
                    updateTotalTax =  updateProducts.reduce(0.0) {

                        partialResult, draftorder in
                        partialResult + Float(draftorder.totalTax)!

                      }
                }

                self?.shoppingCartProducts = updateProducts
                self?.totalTax = updateTotalTax
                self?.totalPrice = updateTotalPrice
                self?.subTotalPrice = updateSubTotalPrice
                return true
            })
        }}
}
