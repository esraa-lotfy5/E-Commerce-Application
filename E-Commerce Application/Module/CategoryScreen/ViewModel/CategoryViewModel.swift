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
    @Published var selectedCategory : CategoryTabs.Category = .Men
    @Published  var products :[CategoryProduct] = []
    @Published var param : [String: String] = ["vendor":"","collection_id":"273053679755","product_type":""] // by default for men
    @Published var isProductTypeChanged = ""
    var api :NetworkAPIProtocol = NetworkAPI()
    
    init() {
        getProducts()
    }
    func getProducts(){
        let newParameters = updateParameters()
        api.getCategoryProducts(parameters: newParameters){(result) in
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
    
    func updateParameters() -> [String:String]{
        print("before updating params: \(param)")
        var newParam = param
        if(param["vendor"] == ""){newParam.removeValue(forKey: "vendor")}
        if(param["collection_id"] == ""){newParam.removeValue(forKey: "collection_id")}else{
            switch(newParam["collection_id"]){
            case "Men", "273053679755":
                newParam.updateValue("273053679755", forKey: "collection_id")
                break
            case "Women", "273053712523":
                newParam.updateValue("273053712523", forKey: "collection_id")
                break
            case "Kids", "273053745291":
                newParam.updateValue("273053745291", forKey: "collection_id")
                break
            case "Sale", "273053778059":
                newParam.updateValue("273053778059", forKey: "collection_id")
                break
            default:
                break
            }
        }
        if(param["product_type"] == ""){newParam.removeValue(forKey: "product_type")}
        
        print("-------------------------new param -----------------")
        print("after updating param: \(newParam)")
        return newParam
    }
}
