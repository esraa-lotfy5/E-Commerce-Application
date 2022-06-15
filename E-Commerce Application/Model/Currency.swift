//
//  Currency.swift
//  E-Commerce Application
//
//  Created by Aya Abdelraouf on 15/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation


struct Currency :Decodable{
    
    var base :String
    var rates : Rates
}

struct Rates : Decodable{
    var EGP :Float
    var USD : Float
    var AED :Float
    var AFN :Float
}


//{
//"success": true,
//"timestamp": 1655287803,
//"base": "EUR",
//"date": "2022-06-15",
//"rates": {
//    "EGP": 19.688533,
//    "USD": 1.048383,
//    "AED": 3.850696,
//    "AFN": 93.488832
//}
//}
