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
    @Published  var updatedCurrency :Currency =  Currency(base: "USD", rates: Rates(EGP: 14.2, USD: 1.55, AED: 1.568, AFN: 1.568))
    
    
   
    
    init() {
        
        updatedCurrencyFunc()
        CurrencyActivate = true
        
    }
    

    
    
    
    func updatedCurrencyFunc() {
        api.getUpdatedCurrency(baselan: "USD") {(result) in
            switch result {
            case.success(let response):
                self.updatedCurrency = response ?? Currency(base: "USD", rates: Rates(EGP: 14.2, USD: 1.55, AED: 1.568, AFN: 1.568))
                print ("currency :  \(self.updatedCurrency.rates.EGP)")
                
                
                
            case.failure(let error):
                   // Show UI Error
                    print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
                }
                
            }
            
        

        }
    
    var CurrencyActivate: Bool = UserDefaults.Activated {
        willSet {
            UserDefaults.Activated = newValue
           
            
           
        }
    }


    var setUsetDefault: CurrencyType = UserDefaults.setData {
        willSet {
            UserDefaults.setData = newValue
            print(UserDefaults.setData)
            print( "the new value : \(newValue)")
            
            if (newValue == CurrencyType.EGP ){
            UserDefaults.standard.set( updatedCurrency.rates.EGP,forKey: "currencyValue")
            UserDefaults.standard.set( "EGP",forKey: "currencyString")
            }
            else{
            UserDefaults.standard.set( updatedCurrency.rates.USD,forKey: "currencyValue")
            UserDefaults.standard.set( "USD",forKey: "currencyString")
            }
        }
    }
    
    }
    



extension UserDefaults {

    private struct Keys {
        static let Activated = "Activated"
        static let setData = "setData"
        static let currency = "currency"
        
    }

  
    static var Activated: Bool {
        get { return UserDefaults.standard.bool(forKey: Keys.Activated) }
        set { UserDefaults.standard.set(newValue, forKey: Keys.setData) }
    }

   
    static var setData: CurrencyType {
        get {
            if let value = UserDefaults.standard.object(forKey: Keys.setData) as? String {
                return CurrencyType(rawValue: value)!
            }
            else {
                return .USD
            }
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: Keys.setData)
        }
    }
    

    
    
}
