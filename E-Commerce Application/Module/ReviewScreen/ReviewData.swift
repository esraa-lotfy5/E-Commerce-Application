//
//  ReviewData.swift
//  E-Commerce Application
//
//  Created by NourAllah Ahmed on 12/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
struct CustomReview: Hashable {
    var userName: String?
    var reviewBody: String?
    var reviewRate : String?
}

class GenerateReview{
    var ReviewData  : [CustomReview] = [CustomReview] ()
    var names = ["Nour", "Nihal","Mohamed","Esraa","Ahmed","Abdelrahman","Aya","Nouran","Marwan","Nayra","Karam" ,"Zienab","Hala","Rana","Mariam","Ghada","Shrouk","Asmaa"]
    
    var reviewBody = [
        "awesome Product",
        "Good quality",
        "nice",
        "not bad",
        "Used it for a while pretty nice",
        "So good I recommend",
        "Perfect Perfect Perfect Perfect",
        "i do not like the material but it is a good price",
        "😊😊",
        " easy to use, perfect",
        " Very comfortable " ,
        " Fast delivery and fitting size as discriped ",
        " Very good material and quality " ,
        " Exact size. The material is great and very suitable with the price ",
        " Perfect fit ",
        "Very comfortable, soft and fit.",
        " Excellent quality and price",
        "❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️"
    ]
    
    var reviewRate = ["3","4","5"]
    func generateReview() -> [CustomReview]{
        for _ in 0...50{
            let review = CustomReview(userName: names.randomElement(), reviewBody: reviewBody.randomElement(), reviewRate: reviewRate.randomElement())
            ReviewData.append(review)
        }
      
        return ReviewData
    }
}
