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
    func getAllDraftOrders(){
        networkApi.getAllDraftOrders { result in
            print("request \(String(describing: try? result.get()?.draftOrders))")
            try? result.get()?.draftOrders.filter({ DraftOrder in
                if(DraftOrder.email == "nourallahahmed1100@gamil.com") //TODO: get the current users email
                {
                    if (DraftOrder.note == "cart"){
                        self.shoppingCartProducts.append(DraftOrder)
                    }
                    print("from ShoppingCartViewModel")
                    print(self.shoppingCartProducts)
                }
                return true
            })
        }
    }
    
    func deleteDraftOrder(draftOrderID: Int) {
        networkApi.deleteDraftOrder(draftOrder: draftOrderID)
    }
    
}
