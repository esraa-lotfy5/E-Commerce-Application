//
//  Address.swift
//  E-Commerce Application
//
//  Created by Aya Abdelraouf on 05/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation


struct AllAddress :Codable{
    
    var addresses :[Addresss]!
    
}

struct Addresss :Codable,Identifiable{
    var id :Int64

    var address1:String
    var city :String
    var country :String
    
    
    
    
   // {"address":{"address1":"1 Rue des Carrieres","address2":"Suite 1234","city":"Montreal","company":"Fancy Co.","first_name":"Samuel","last_name":"de Champlain","phone":"819-555-5555","province":"Quebec","country":"Canada","zip":"G1R 4P5","name":"Samuel de Champlain","province_code":"QC","country_code":"CA","country_name":"Canada"}}
    
}
