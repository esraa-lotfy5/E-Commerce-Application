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
    @Published var wishList : [DraftOrder] = []

    
    init() {
        getFavorites()
    }

    func getFavorites(){
        api.getAllDraftOrders { (result) in
            try? result.get()?.draftOrders.filter({ draftFavorite in
                    if(draftFavorite.email == "iosteam@gmail.com" && draftFavorite.note == Constants.favorite){
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
