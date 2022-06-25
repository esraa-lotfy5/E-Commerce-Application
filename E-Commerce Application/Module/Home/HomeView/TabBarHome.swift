//
//  TabBarHome.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 6/2/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import SwiftUI
@available(iOS 15.0, *)

struct TabBarHome: View {

    var body: some View {

        TabView{
            if #available(iOS 14.0, *) {
                HomeScreen()
                    .tabItem{
                        Image(systemName: "house")
                        Text("Home")
                    }
            } else {
                // Fallback on earlier versions
            }
            
            
            CategoryScreen(brandName: "")
                .tabItem{
                    Image(systemName: "rectangle.grid.3x2.fill")
                    Text("Category")
            }
            
            
            ProfileScreen()
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Profile")
            }
        }
        
    }
}
