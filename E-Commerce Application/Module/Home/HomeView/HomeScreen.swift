//
//  HomeScreen.swift
//  E-Commerce Application
//
//  Created by NourAllah Ahmed on 6/1/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import SwiftUI
struct HomeScreen: View {
    @ObservedObject  var viewModel = HomeViewModel()
    //trial
    @State var presentAlert = false
    @State var shouldShownOnBoarding : Bool = true
    let timer = Timer.publish(every: 2.0, on: .main, in: .common).autoconnect()

   // @AppStorage("count") var count : Int = 1
    @State private var count = UserDefaults.standard.integer(forKey: "count")
    
    @State var isShown:Bool = true
var body: some View {
    if #available(iOS 14.0, *) {
        VStack{
            NavigationHome()
            BannerView()
            BrandsView()
            /////   TabBarHome()
            //    Text("\(viewModel.str.count)")
            
            Spacer()
        }    .fullScreenCover(isPresented:
                                $shouldShownOnBoarding, content: {
            OnBoardingView(shouldShowOnBoarding: $shouldShownOnBoarding)
        })
    } else {
        // Fallback on earlier versions
    }
    
//    .blur(radius: presentAlert ? 30 : 0)
//    
//        .onReceive(timer, perform: { _ in
//
//            
//            if count >= 5 {
//                presentAlert.toggle()
//                count = 1
//                
//            }
//            else{
//                count += 1
//            }
//            
//            
//            
//        })
//
//        if  presentAlert {
//            AlertViewHome(show: $presentAlert)
//        }
    //.navigationBarBackButtonHidden(true)
    
    }

}
