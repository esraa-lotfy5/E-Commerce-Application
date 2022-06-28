//
//  CategoryViewModel.swift
//  E-Commerce Application
//
//  Created by Esraa Lotfy  on 10/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import SwiftUI
import Network
class CategoryViewModel : ObservableObject{
    var brandName : String?
    @Published var selectedCategory : CategoryTabs.Category = .Men
    @Published  var products :[CategoryProduct] = []
    @Published var searchEnbled = false
    @Published var productsCopy : [CategoryProduct] = []
    @Published var param : [String: String] = ["vendor":"","collection_id":"286254596269","product_type":""] // by default for men
    @Published var isProductTypeChanged = ""
    var api :NetworkAPIProtocol = NetworkAPI()
    
    //Internet
    @Published var NetworkState : Bool = true

    let queue = DispatchQueue(label: "InternetConnectionMonitor")
    let monitor = NWPathMonitor()
    
    
    init(brandName: String) {
        param.updateValue(brandName, forKey: "vendor")
        getProducts()
    }
    func getProducts(){
        let newParameters = updateParameters()
//        print(newParameters)
        monitor.pathUpdateHandler = { [weak self] pathUpdateHandler  in
            if pathUpdateHandler.status == .satisfied {
                DispatchQueue.main.sync {
                    self?.NetworkState = true
                }
                self?.api.getCategoryProducts(parameters: newParameters){(result) in
                    switch result {
                    case .success(let response):
                        let productsResponse = response
                        //print("-----------------------------------")
                        self?.products = productsResponse?.products ?? []
                  
                    case .failure(let error):
                        // Show UI Error
                        print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
                    }
            
                }
            } else{
                DispatchQueue.main.sync {
                    self?.NetworkState = false
                }
            }
        }
        monitor.start(queue: queue)

    }
    
    func updateParameters() -> [String:String]{
//        print("before updating params: \(param)")
        
        var newParam = param
//        let newParameters = updateParameters()
     
                if(self.param["vendor"] == ""){newParam.removeValue(forKey: "vendor")}
                if(self.param["collection_id"] == ""){newParam.removeValue(forKey: "collection_id")}else{
            switch(newParam["collection_id"]){
            case "Men", "286254596269":
                newParam.updateValue("286254596269", forKey: "collection_id")
                break
            case "Women", "286254629037":
                newParam.updateValue("286254629037", forKey: "collection_id")
                break
            case "Kids", "286254661805":
                newParam.updateValue("286254661805", forKey: "collection_id")
                break
            case "Sale", "286254694573":
                newParam.updateValue("286254694573", forKey: "collection_id")
                break
            default:
                break
            }
        }
        if(self.param["product_type"] == ""){newParam.removeValue(forKey: "product_type")}
        
        
        return newParam
    }
}
