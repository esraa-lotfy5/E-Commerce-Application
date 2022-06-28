//
//  SettingsViewModel.swift
//  E-Commerce Application
//
//  Created by Aya Abdelraouf on 15/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//
import Foundation
import Alamofire



class SettingsViewModel:ObservableObject{
    var api :NetworkAPIProtocol = NetworkAPI()
    @Published  var updatedCurrency :Currency =  Currency(base: "EGP", rates: Rates(EGP: 14.2, USD: 1.55, AED: 1.568, AFN: 1.568))
    
    
   
    
    @Published var currencyType: CurrencyType {
        didSet {
            UserDefaults.standard.set(currencyType.rawValue, forKey: "options")
            if( currencyType.rawValue).elementsEqual("EGP") {
                UserDefaults.standard.set(true, forKey: "isEGP")
                print ("is egp")
            }else{
                UserDefaults.standard.set(false, forKey: "isEGP")
                print ("is usd")
            }
        }
    }
    
    init() {
       
     
        self.currencyType = (UserDefaults.standard.object(forKey: "options") == nil ? CurrencyType.EGP : CurrencyType(rawValue: UserDefaults.standard.object(forKey: "options") as! String)) ?? CurrencyType.EGP
              
        updatedCurrencyFunc()
        
        
        
    }
    func updatedCurrencyFunc() {
        api.getUpdatedCurrency(baselan: "USD") {(result) in
            switch result {
            case.success(let response):
                self.updatedCurrency = response ?? Currency(base: "USD", rates: Rates(EGP: 14.2, USD: 1.55, AED: 1.568, AFN: 1.568))
                print ("currency :  \(self.updatedCurrency.rates.EGP)")
                UserDefaults.standard.set(self.updatedCurrency.rates.EGP, forKey: "EGP")
                UserDefaults.standard.set(self.updatedCurrency.rates.USD, forKey: "USD")
                
                
                
            case.failure(let error):
                   // Show UI Error
                    print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
                }
                
            }
            
        

        }
    
   

    

    
    
}
