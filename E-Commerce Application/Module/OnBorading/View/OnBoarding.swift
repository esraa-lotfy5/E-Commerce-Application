//
//  OnBoarding.swift
//  E-Commerce Application
//
//  Created by NourAllah Ahmed on 15/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import SwiftUI
//@available(iOS 13.0, *)
struct OnBoardingView : View {
    var body : some View{
        if #available(iOS 14.0, *) {
            TabView{
                CustomPage(image: "welcome", title: "Welcome To Shoopingo", desc: "Start enjoying the online shopping and see your favorite brands")
                
                CustomPage(image: "filter", title: "",
                           
                           desc: "Explore and filter Brand`s Product")
                
                CustomPage(image: "AddProducts", title: "", desc: "Save your favorite products in your WishList and add them in your shopping cart")
                
                CustomPage(image: "explore the products", title: "", desc: "Enjoy exploring the products ")
                
                CustomPage(image: "pay online", title: "", desc: "Pay online or cash")
                
                CustomPage(image: "pick location", title: "", desc: "Pick your addresses")
                
                CustomPage(image: "fast deliver", title: "", desc: "Fast delivery")
                
                
            }.tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
        } else {
            // Fallback on earlier versions
        }
    }
}

struct CustomPage : View {
    var image : String
    var title : String
    var desc  : String
    var body : some View{
        VStack{
        Image( image)
            .resizable()
            .scaledToFit()
            .padding()
        
        Text(title)
                .font(.system(size: 20))
                .foregroundColor(.pink)

            .padding()
        
        Text (desc)
                .font(.system(size: 30))
                .foregroundColor(.blue)

            .padding()
        }
    }
}
//nourallahahmed1100@gamil.com
//password
