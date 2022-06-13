//
//  PriceRule.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 11/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
struct PriceRules : Codable{
    var price_rules : [PriceRule]
}

struct PriceRule : Codable , Hashable {

//    var id : Int64
//    var value_type : String
//    var value : String
//    var customer_selection : String
//    var target_type : String
//    var target_selection : String
//    var allocation_method : String
//    var usage_limit : Int64
   // var starts_at : String
    
    
    
    //2nd trial
     var title: String
     var target_type: String
    var target_selection: String
    var allocation_method: String
    var value_type: String
    var value: String
    var customer_selection: String
    var starts_at: String
}


//"id": 1089622507659,
//            "value_type": "fixed_amount",
//            "value": "-10.0",
//            "customer_selection": "all",
//            "target_type": "line_item",
//            "target_selection": "all",
//            "allocation_method": "across",
//            "allocation_limit": null,
//            "once_per_customer": false,
//            "usage_limit": 3,
