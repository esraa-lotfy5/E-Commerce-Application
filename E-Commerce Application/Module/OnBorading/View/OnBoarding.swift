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
              
                CustomPage(image: "welcome",
                       
                           desc: "Start enjoying the online shopping and see your favorite brands",
                           shownsDismissButton: false,
                           shouldShowOnBoarding: $shouldShowOnBoarding,
                           skipBtn: true)

//                CustomPage(image: "TabHome",
//
//                           desc: "You Can swip to Home to see your Brands",
//                           shownsDismissButton: false,
//                           shouldShowOnBoarding: $shouldShowOnBoarding,
//                           skipBtn: false)

                CustomPage(image: "BrandsOnHome", desc: "See Your Favorite Brands ", shownsDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false)
//
//                CustomPage(image: "AdsInHome",  desc: "See Our new ADs", shownsDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false)

                CustomPage(image: "SettingsOnHome", desc: "You Can Edit your Settings", shownsDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false)
//
//                //TODO: settings
//

                CustomPage(image: "CategoryTab",  desc: "Swipe to Category to see most recent Products ", shownsDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false)

                CustomPage(image: "filterByType", desc: "Filter Your Product", shownsDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false)


//                CustomPage(image: "filterbygender",  desc: "Categories Your Product", shownsDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false)


                CustomPage(image: "gotoCart",desc: "See Your Shopping Cart", shownsDismissButton: true, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false)


                CustomPage(image: "gotoWishlist",desc: "See Your WishList", shownsDismissButton: true, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false)

                CustomPage(image: "seeDescAndRateAndPickQuantity", desc: "See product details and images", shownsDismissButton: true, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false)

                CustomPage(image: "choiceSizeAndColor",  desc: "Choice your size and prefer color", shownsDismissButton: true, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false)

                CustomPage(image: "AddToCartBtn",  desc: "And add the Product on your shopping cart", shownsDismissButton: true, shouldShowOnBoarding: $shouldShowOnBoarding, skipBtn: false)
                
            }.tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                  
               
        } else {
            // Fallback on earlier versions
        }
    }
}

struct CustomPage : View {
    var image : String
//    var title : String
    var desc  : String
    let shownsDismissButton :Bool
    @Binding var shouldShowOnBoarding : Bool
    var skipBtn : Bool

    var body : some View{
        VStack{
        Image( image)
            .resizable()
            .frame(width: UIScreen.main.bounds.width, height: 500)
            .padding()
            .overlay(ImageOverlay(desc: desc), alignment: .bottom )
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
                .foregroundColor(.blue)
        }.background(Color.white)
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(6)
    }
}
//nourallahahmed1100@gamil.com
//password
