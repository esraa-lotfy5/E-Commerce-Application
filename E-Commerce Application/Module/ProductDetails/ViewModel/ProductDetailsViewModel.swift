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
    //trial
    @Published var favoriteHere : Bool = false
    @Published var favoriteItem : DraftOrder?
    
    var draftOrderID :Int?
    func getProductDetails(id:String , completion : @escaping (Result <ProductsResults? , NSError>) -> Void){
        networkapi.getProductDetails(id: id) { (result) in
            self.Products = try? result.get()?.product
        }
    }
    
    
    func getProductInventoryQuantity(id:String , completion : @escaping (Result <ProductInventoryQuantity? , NSError>) -> Void){
        networkapi.getProductInventoryQuantity(id: id) { (result) in
            self.productInventoryQuantity = try? result.get()
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
                    print(DraftOrder)
                
                    if (DraftOrder.note == "cart"){
                        self.draftOrderID = DraftOrder.id
                        self.draftOrder = DraftOrder


                    }
                }
                return true
            })
        }
    }

    
    func postDraftOrder(variantId: Int , quantity : Int , selectedSize : String){
        let parameters =     [
            "draft_order": [
                "email" : "nourallahahmed1100@gamil.com",  //TODO: get the current users email
                "note" : "cart",
                "note_attributes": [
                    ["name": "image","value":Products?.image?.src ?? "default"],
                    ["name": "size","value" : selectedSize]
                        
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

    //trial favorite
    func postFavorite (variantIDFav : Int){
        let favoriteObjectParameters = [
            "draft_order": [
                "email" : "iosteam@gmail.com",  //TODO: get the current users email
                "note" : Constants.favorite,
                "note_attributes": [
                    ["name": "image","value":Products?.image?.src ?? "default"]
                        ]
                
                ,
                "line_items": [[
                    "variant_id": variantIDFav,
                     "quantity":  1
                ]]
            ]
        ]
        print("\n \(favoriteObjectParameters) \n")
        networkapi.postDraftOrder(parameter: favoriteObjectParameters)
        print("\n after view model function \n ")
        self.getAllDarftOrder()
    }


    
    func deleteFavorite(draftFavoriteID: Int){
        networkapi.deleteDraftOrder(draftOrder: draftFavoriteID)
        }
   
    

    
    func getFavorites(variantIDFav : Int) -> Bool {
        self.fetchData(target: .getDraftOrders , responseClass:
        DraftOrders.self) { (result) in
        try? result.get()?.draftOrders.filter({ draftFavorite in
                if(draftFavorite.email == "iosteam@gmail.com" && draftFavorite.note == Constants.favorite){
                      for index in 0 ..< (draftFavorite.lineItems?.count ?? 0) {
                           if  draftFavorite.lineItems?[index].variantId == variantIDFav {
                               self.favoriteHere = true
                               self.favoriteItem = draftFavorite
                                print("\n FAVORITE ITEM IS FOUND \n")
                               print("Favorite here \(self.favoriteHere)")
                               
                            }
                        }
                }else{
                    self.favoriteHere = false
                }
            return true
        })
        }
       // print("\n from view model \(favoriteHere) \n ")
        return favoriteHere
    }
    
    
    
    
    
    
    
    
    
    
    
}
