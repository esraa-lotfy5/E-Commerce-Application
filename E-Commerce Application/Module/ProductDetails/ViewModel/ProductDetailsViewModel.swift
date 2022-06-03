//
//  ProductDetailsViewModel.swift
//  E-Commerce Application
//
//  Created by NourAllah Ahmed on 6/2/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
class ProductDetailsViewModel :BaseAPI<NetworkRequest> , ObservableObject{
    @Published var Products : [Product]?
    func getProductDetails(id:String , completion : @escaping (Result <ProductsResults? , NSError>) -> Void){
        self.fetchData(target: .getProductDetials(productID: id), responseClass:
        ProductsResults.self) { (result) in
            print("hello \(result)")
            completion(result)
        }//.getProductDetials(productID: id)
    }
    
}
