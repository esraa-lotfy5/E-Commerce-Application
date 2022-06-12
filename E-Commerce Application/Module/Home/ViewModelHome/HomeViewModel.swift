//
//  HomeViewModel.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 10/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import Alamofire


class HomeViewModel : ObservableObject {
    var api :NetworkAPIProtocol = NetworkAPI()
    @Published var brands : [SmartCollection] = []
    @Published var brandsArr : [Brand] = []
    @Published var discountArr : [DiscountCode] = []
    @Published var priceArr : [PriceRule] = []
    //trial
   // price rule id = 1095463338123 -- use when posting discount code
//    let priceRuleObj = [
//        "price_rule": [
//            "title": "SUMMERSALE10OFF",
//            "target_type": "line_item",
//            "target_selection": "all",
//            "allocation_method": "across",
//            "value_type": "fixed_amount",
//            "value": "-10.0",
//            "customer_selection": "all",
//            "starts_at": "2021-12-10T13:00:10Z"
//        ]
//    ]
    
    init(){
         getSmartCollections()
        
        //trial
        getPriceRule ()
         getDiscountCodes()
    }

    
    public func getSmartCollections(){
        api.getSmartCollections {  (result) in
            switch result {
            case .success(let response):
                let responseBrand = response
                
                self.brands = responseBrand?.smart_collections ?? []
                print(self.brands)
                for brand in responseBrand?.smart_collections ?? [] {
                    
                    //print("BRAND TITLE  : \(brand.title)")
                    var b = Brand(brandImage: brand.image.src, brandTitle: brand.title)
                    self.brandsArr.append(b)
                   // print(self.brandsArr)
                }
                
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
            }

        }
    }
    
    //trial

    func getPriceRule (){
        api.getPriceRule { [self] (result) in
            switch result {
            case .success(let response):
                let responsePriceRule = response
                print("PRICE RULE GETTTT\(String(describing: responsePriceRule))")
                //i stopped here array part 
                for item in responsePriceRule?.price_rules ?? [] {
                    var name = item.title
                    switch name {
                    case "OPENING45OFF":
                        print ("eshta")
                        self.priceArr.append(item)
                    case "SALE15OFF":
                        print ("eshta")
                        self.priceArr.append(item)
                    default:
                        print("mesh naf3a")
                    }
                }
                print("\n ARRAYYYY OF PRICE RANGE \n")
                print(priceArr)
                
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
            }
        }
        
    }
    
    func postPriceRule (priceRule : Parameters){
        api.postPriceRule(priceRule: priceRule) { (result) in
            switch result {
            case .success(let response):
                let responsePriceRule = response
                print("PRICE RULE POSSSSSTTT\(String(describing: responsePriceRule))")
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
            }
        }
    }
    

    
    func postDiscountCode (discountCode : Parameters){

        api.postDiscountCode(discountCode: discountCode, discountId: "1095463338123") { (result) in
            switch result {
            case .success(let response):
                let responseDiscountRule = response
                print("DISCOUNT CODE POSTTTTTTT\(String(describing: responseDiscountRule))")
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
            }
        }
    }

    
    func getDiscountCodes (){
        api.getDiscountCode(discountId: "1095463338123") { (result) in
            switch result {
            case .success(let response):
                let responseDiscount = response
                print("RESPONSE DISCOUNT CODE === \(responseDiscount)")
                self.discountArr = responseDiscount?.discountCodes ?? []
                for discount in self.discountArr {
                    print("DISCOUNT CODE == \(discount.code)\n")
                    
                }
                
                
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
                
            }
        }
    }
    

    
    
}
