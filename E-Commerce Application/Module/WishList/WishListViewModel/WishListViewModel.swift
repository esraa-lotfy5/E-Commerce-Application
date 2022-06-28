//
//  WishListViewModel.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 15/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import Alamofire


class WishListViewModel : ObservableObject {
    var api :NetworkAPIProtocol = NetworkAPI()
    private let currEmail = UserDefaults.standard.string(forKey: "email")
    @Published var wishList : [DraftOrder] = []

    
    init() {
        getFavorites()
    }

    func getFavorites(){
        api.getAllDraftOrders { (result) in
            try? result.get()?.draftOrders.filter({ draftFavorite in
                if(draftFavorite.email == self.currEmail ??  "" && draftFavorite.note == Constants.favorite){
                          for index in 0 ..< (draftFavorite.lineItems?.count ?? 0) {
                              self.wishList.append(draftFavorite)
                            }
//                        print("WISHLIST ARRAY == \(self.wishList)")
                    }
                return true
            })
        }
       // return wishList
    }








}


//in viewmodel
//func updateInventoryLevel (inventoryItem : Parameters) -> Bool{
//    var returned : Bool = false
//    api.updateInventoryLevel(InventoryItem: inventoryItem) { (result) in
//                    switch result {
//                    case .success(let response):
//                        let responseInventoryItem = response
//                        print("INVENTORY ITEM POSTTTTTTT\(String(describing: responseInventoryItem))")
//                        returned = true
//                    case .failure(let error):
//                        print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
//                    }
//    }
//    return returned
//
//}


//in view
////////edit inventory item
//        Button {
//                                                   let inventoryItemObj = [
//                    "location_id": Constants.locationId,
//                    "inventory_item_id": 43702138863789,
//                    "available_adjustment": -1
//              ]
//                    viewModelInventory.updateInventoryLevel(inventoryItem: inventoryItemObj)
//        } label: {
//            Text("update value the inventory item of certain item")
//                .padding()
//                .foregroundColor(.blue)
//
//        }
 //end of edit button
