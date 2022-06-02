//
//  TabBarHome.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 6/2/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import SwiftUI

struct TabBarHome: View {

    var body: some View {

        TabView{
            HomeScreen()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
            }
            
            
            CategoryScreen()
                .tabItem{
                    Image(systemName: "rectangle.grid.3x2.fill")
                    Text("Category")
            }
            
            
            ProfileScreen(userloggedIn: true)
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Profile")
            }
        }
        
    }
}
