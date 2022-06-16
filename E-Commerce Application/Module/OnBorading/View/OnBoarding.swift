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
    @Binding var shouldShowOnBoarding : Bool

    var body : some View{
        if #available(iOS 14.0, *) {
            TabView{
                CustomPage(image: "welcome", title: "Welcome To Shoopingo", desc: "Start enjoying the online shopping and see your favorite brands", shownsDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: true)
                
                CustomPage(image: "filter", title: "",
                           
                           desc: "Explore and filter Brand`s Product", shownsDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false)
                
                CustomPage(image: "AddProducts", title: "", desc: "Save your favorite products in your WishList and add them in your shopping cart", shownsDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false)
                
                CustomPage(image: "explore the products", title: "", desc: "Enjoy exploring the products ", shownsDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false)
                
                CustomPage(image: "pay online", title: "", desc: "Pay online or cash", shownsDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false)
                
                CustomPage(image: "pick location", title: "", desc: "Pick your addresses", shownsDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false)
                
                CustomPage(image: "fast deliver", title: "", desc: "Fast delivery", shownsDismissButton: true, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false)
                
                
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
    let shownsDismissButton :Bool
    @Binding var shouldShowOnBoarding : Bool
    var skipBtn : Bool

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
        
        if shownsDismissButton{
            Button {
                shouldShowOnBoarding.toggle()
            } label: {
                Text("Get Started")
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 200, height: 40)
                    .background(Color.pink)
                    .cornerRadius(6)
            }
        }
            
            if skipBtn{
                Button {
                    shouldShowOnBoarding.toggle()
                } label: {
                    Text("Skip")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40)
                        .background(Color.pink)
                        .cornerRadius(6)
                }
            }
        }
    }
}
//nourallahahmed1100@gamil.com
//password
