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

var body: some View {
    VStack{
                NavigationHome()
                BannerView()
                BrandsView()
             //   TabBarHome()
                
            }
.navigationBarHidden(true)
//        .navigationBarTitle("Home")
    }
}
