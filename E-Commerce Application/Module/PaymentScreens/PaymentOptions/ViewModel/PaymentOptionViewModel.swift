//
//  PaymentOptionViewModel.swift
//  E-Commerce Application
//
//  Created by Aya Abdelraouf on 15/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation



class PaymentOptionViewModel:ObservableObject{
   
   
    
    init() {
        
      
        PaymentOptionsActivate = true
        
    }

   
    var PaymentOptionsActivate: Bool = UserDefaults.Activated {
        willSet {
            UserDefaults.Activated = newValue
           
            
           
        }
    }


    var setUserDefault: PaymentType = UserDefaults.setDataPaymentOptions {
        willSet {
            UserDefaults.setDataPaymentOptions = newValue
            print(UserDefaults.setDataPaymentOptions)
            print( "the new value : \(newValue)")
            
            if (newValue == PaymentType.PayPal ){
              UserDefaults.standard.set("PayPal",forKey: "PaymentOptions")
             UserDefaults.standard.set(true,forKey: "isPayPal")
           
            }
            else{
                UserDefaults.standard.set("deleviryOnCash",forKey: "PaymentOptions")
              //  UserDefaults.standard.set(false,forKey: "isPayPal")
            }
        }
    }
    
    }
    



extension UserDefaults {

    private struct Keys {
        static let ActivatedPaymentOptions = "Activated"
        static let setDataPaymentOptions = "setData"
        //static let currency = "currency"
        
    }

  
    static var ActivatedPaymentOptions: Bool {
        get { return UserDefaults.standard.bool(forKey: Keys.ActivatedPaymentOptions) }
        set { UserDefaults.standard.set(newValue, forKey: Keys.setDataPaymentOptions) }
    }

   
    static var setDataPaymentOptions: PaymentType {
        get {
            if let value = UserDefaults.standard.object(forKey: Keys.setDataPaymentOptions) as? String {
                return PaymentType(rawValue: value) ?? PaymentType.PayPal
            }
            else {
                return .PayPal
            }
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: Keys.setDataPaymentOptions)
        }
    }
    

    
    
}

