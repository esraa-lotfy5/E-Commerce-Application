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
    func getProductDetails(id:String , completion : @escaping (Result <ProductsResults? , NSError>) -> Void){
        self.fetchData(target: .getProductDetials(productID: id), responseClass:
        ProductsResults.self) { (result) in
            print("hello \(try? result.get()?.product?.options)")
            self.Products = try? result.get()?.product
            completion(result)
        }//.getProductDetials(productID: id)
    }
    
}
