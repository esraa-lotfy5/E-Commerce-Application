//
//  PaymentOptionViewModel.swift
//  E-Commerce Application
//
//  Created by Aya Abdelraouf on 15/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation



/*
  Tip I learned: I store things I need to propagate throughout the app in an "observable" class
  That way, every time one of the published field (the ones with the @Published property wrapper)
  changes, any view watching this "store" class will be updated.

  And yes, this sounds a lot like what frontend developers are familiar with when using things
  like Redux :)
*/
class Store: ObservableObject {
 

    @Published var paymentType: PaymentType {
        didSet {
            UserDefaults.standard.set(paymentType.rawValue, forKey: "palCash")
            if( paymentType.rawValue).elementsEqual("Cash") {
            UserDefaults.standard.set(true, forKey: "isPay")
            }else{
                UserDefaults.standard.set(false, forKey: "isPay")
            }
        }
    }
    init() {
        /*
           Here we load the data from user default, so that the proper temperature and speed units
           are available the moment the app loads and this class is instantiated.
        */
       
        
        self.paymentType = (UserDefaults.standard.object(forKey: "palCash") == nil ? PaymentType.PayPal : PaymentType(rawValue: UserDefaults.standard.object(forKey: "palCash") as! String)) ?? PaymentType.PayPal
        
        
    }
}

