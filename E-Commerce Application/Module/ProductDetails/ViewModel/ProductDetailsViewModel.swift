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
        }//.getProductDetials(productID: id)
    }
    
    
}
