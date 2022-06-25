//
//  DiscountCodeViewModel.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 17/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import Alamofire


class DiscountCodeViewModel: ObservableObject {
    var api :NetworkAPIProtocol = NetworkAPI()
    @Published var discountArr : [DiscountCode] = []
    @Published var priceArr : [PriceRule] = []
    @Published var returnedValue : String?
    
    
    
    init(){
        getPriceRule ()
         getDiscountCodes()
    }
    
    
    //trial

    func getPriceRule (){
        api.getPriceRule { [self] (result) in
            switch result {
            case .success(let response):
                let responsePriceRule = response
////                print("PRICE RULE GETTTT\(String(describing: responsePriceRule))")
//                //i stopped here array part
//                for item in responsePriceRule?.price_rules ?? [] {
//                    var name = item.title
//                    switch name {
//                    case "OPENING45OFF":
//                        print ("BACKKK")
//                        self.priceArr.append(item)
//                    case "SALE15OFF":
//                        print ("BACKKK")
//                        self.priceArr.append(item)
//                    default:
//                        print("NOT OUR PROMO CODE")
//                    }
//                }
////                print("\n ARRAYYYY OF PRICE RANGE \n")
////                print(priceArr)
                priceArr = responsePriceRule?.price_rules ?? []
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
            }
        }
        
    }
    
    func getDiscountValue (promo : String) -> String{
        //var returnedValue : String?
        api.getPriceRule { [self] (result) in
            switch result {
            case .success(let response):
                let responsePriceRule = response
//                print("PRICE RULE GETTTT\(String(describing: responsePriceRule))")
                //i stopped here array part
                for item in responsePriceRule?.price_rules ?? []{
                    var name = item.title
//                    if promo == name{
//                        returnedValue =  item.value
//                    }
//                    print("\n NAME == \(name)")
                    if name == promo {
//                        print("\n FOUNDEDDDD \n")
//                        print("\n \(item.title)")
                        returnedValue = item.value
//                        print("\n \(returnedValue)")
                    }
                }
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
            }
        }
        return returnedValue ?? "0"
    }
    
    
    func postPriceRule (priceRule : Parameters){
        api.postPriceRule(priceRule: priceRule) { (result) in
            switch result {
            case .success(let response):
                let responsePriceRule = response
//                print("PRICE RULE POSSSSSTTT\(String(describing: responsePriceRule))")
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
//                print("DISCOUNT CODE POSTTTTTTT\(String(describing: responseDiscountRule))")
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
//                print("RESPONSE DISCOUNT CODE === \(responseDiscount)")
                
                self.discountArr = responseDiscount?.discountCodes ?? []
                
                for discount in self.discountArr {
//                    print("DISCOUNT CODE == \(discount.code)\n")

                }
                
                
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
                
            }
        }
    }
    
    
//    //call the function to get the value -- start
    
//        viewModelDiscount.getDiscountValue(promo: "SALE15OFF")
//    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//        if viewModelDiscount.returnedValue != "0"{
//            print("GET FUNCTION VALUE DISCOUNT == \(viewModelDiscount.returnedValue)")
//
//        }else{
//            viewModelDiscount.getDiscountValue(promo: "SALE15OFF")
//
//        }
//
//    }
//    //call the function to get the value -- end
    
    
    
}
