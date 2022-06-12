//
//  CategoryViewModel.swift
//  E-Commerce Application
//
//  Created by Esraa Lotfy  on 10/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import SwiftUI

class CategoryViewModel : ObservableObject{
    @Published  var products :[CategoryProduct] = []
    @Published var param : [String: String] = ["vendor":"","collection_id":"273053679755","product_type":""] // by default for men
    var api :NetworkAPIProtocol = NetworkAPI()
    
    init() {
        if((param["vendor"]?.isEmpty) != nil){param.removeValue(forKey: "vendor")}
        if((param["product_type"]?.isEmpty) != nil){param.removeValue(forKey: "product_type")}else{
            switch(param["product_type"]){
            case "Men":
                param.updateValue("273053679755", forKey: "product_type")
                break
            case "Women":
                param.updateValue("273053712523", forKey: "product_type")
                break
            case "Kids":
                param.updateValue("273053745291", forKey: "product_type")
                break
            case "Sale":
                param.updateValue("273053778059", forKey: "product_type")
                break
            default:
                break
            }
        }
        print("-------------------------param -----------------")
        print(param)
        getProducts()
    }
    
    func getProducts(){
        api.getCategoryProducts(parameters: self.param){(result) in
            switch result {
            case .success(let response):
                let productsResponse = response
                //print("-----------------------------------")
                self.products = productsResponse?.products ?? []
                //print("----------------------------------for: \(self.products.isEmpty)----------")
                for product in self.products{
                    //print("----------------------------------product----------")
                    print("product name -> \(product.title)")
                }
            case .failure(let error):
                // Show UI Error
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
            }
            
        }
    }
}
