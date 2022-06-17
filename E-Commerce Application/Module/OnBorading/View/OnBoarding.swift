//
//  OnBoarding.swift
//  E-Commerce Application
//
//  Created by NourAllah Ahmed on 15/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import SwiftUI
struct OnBoardingView : View {
    @Binding var shouldShowOnBoarding : Bool
    var body : some View{
        if #available(iOS 14.0, *) {
            TabView{
              
                CustomPage(image: "welcome",
                       
                           desc: "Start enjoying the online shopping and see your favorite brands",
                           shownsDismissButton: false,
                           shouldShowOnBoarding: $shouldShowOnBoarding,
                           skipBtn: true, alignment: .bottom)

//                CustomPage(image: "TabHome",
//
//                           desc: "You Can swip to Home to see your Brands",
//                           shownsDismissButton: false,
//                           shouldShowOnBoarding: $shouldShowOnBoarding,
//                           skipBtn: false)

                CustomPage(image: "BrandsOnHome", desc: "See Your Favorite Brands ", shownsDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false, alignment: .bottom)
//
//                CustomPage(image: "AdsInHome",  desc: "See Our new ADs", shownsDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false)

                CustomPage(image: "SettingsOnHome", desc: "You Can Edit your Settings", shownsDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false, alignment: .center)
//
//                //TODO: settings
//

//                CustomPage(image: "CategoryTab",  desc: "Swipe to Category to see most recent Products ", shownsDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false)

                CustomPage(image: "filterYourProducts", desc: "Filter the product", shownsDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false, alignment: .bottom)


//                CustomPage(image: "filterbygender",  desc: "Categories Your Product", shownsDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false)


                CustomPage(image: "gotoCart",desc: "Tap here to see Your Shopping Cart", shownsDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false, alignment: .bottom)


                CustomPage(image: "gotoWishlist",desc: "Tap here to see Your WishList", shownsDismissButton: false , shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false, alignment: .bottom)

                CustomPage(image: "seeDescAndRateAndPickQuantity", desc: "See product details and images", shownsDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false, alignment: .bottom)

                CustomPage(image: "choiceSizeAndColor",  desc: "Choice your size and prefer color", shownsDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false, alignment: .center)

                CustomPage(image: "AddToCartBtn",  desc: "And add the Product on your shopping cart", shownsDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false, alignment: .bottom)
                
                CustomPage(image: "explore the products",  desc: "Lets enjoy the shopping ", shownsDismissButton: true, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false, alignment: .bottom)
            }.tabViewStyle(.page)
        } else {
            // Fallback on earlier versions
        }
    }
}

struct CustomPage : View {
    var image : String
    var desc  : String
    let shownsDismissButton :Bool
    @Binding var shouldShowOnBoarding : Bool
    var skipBtn : Bool
    var alignment : Alignment

    var body : some View{
        VStack{
        Image( image)
            .resizable()
            .frame(width: UIScreen.main.bounds.width, height: 700)
            .padding()
            .overlay(ImageOverlay(desc: desc), alignment: alignment )
//        Text (desc)
//                .font(.system(size: 30))
//                .foregroundColor(.blue)
//
//            .padding()
        
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
struct ImageOverlay: View {
    var desc :String
    var body: some View {
        ZStack {
            Text(desc)
                .font(.system(size: 30))
                .padding(6)
                .foregroundColor(.white)
        }.background(Color.gray)
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding()
    }
}
//nourallahahmed1100@gamil.com
//password
