//
//  NavigationView.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct NavigationHome : View {
    @State private var searchTapped = false

    var body : some View {
//
//        ZStack{
//            HStack{
//
//                Button(action: {
//                }){
//                    Image(systemName: "gear").resizable().frame(width: 30, height: 30).foregroundColor(Color.black.opacity(0.2))
//                }
//                .offset(y:-15)
//                Spacer()
//                Button(action: {
//                }){
//                    Image(systemName: "magnifyingglass").resizable().frame(width: 30, height: 30).foregroundColor(Color.black.opacity(0.2))
//                }.offset(y:-15)
//
//
//            }
//
//
//            HStack( spacing: 10){
//                Text("Home")
//                .bold()
//                .font(.largeTitle)
//                .foregroundColor(.black)
//                .multilineTextAlignment(.trailing)
//
//            }
//
//        }.padding([.top,.horizontal])
//            .background(Color.white)
//
//
//
        VStack{
                    HStack {
                   
                       Spacer().frame(width: 24.0)
                    //  --------- start of Search icon -----------------
                       Button(action: {
                            print(String("settings is clicked"))
                        if(self.searchTapped){
                            self.searchTapped = false
                        }else{
                            self.searchTapped = true
                        }
                       })
                       {
                           HStack {
                               Image(systemName: "gear")
                                   .foregroundColor(.black)
                           }
                           .padding(15)
                           .frame(width: 50, height: 40)
                           .background(Color.white)
                           .cornerRadius(10)
                           .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                       }
                    //  ------------ end of search icon --------------------
                       Spacer()
                    //  ------------- start of header text --------------------------
                       Text("Home")
                           .fontWeight(.bold)
                    //  ------------ end of header text --------------------
                       Spacer()
//                    //  --------- start of cart icon -----------------
//                       Button(action: {
//                           print(String("cart button tapped"))
//                       })
//                       {
//                           HStack {
//                               Image(systemName: "cart")
//                               .foregroundColor(.black)
//                           }
//                           .padding(15)
//                           .frame(width: 50, height: 40)
//                           .background(Color.white)
//                           .cornerRadius(10)
//                           .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
//                       }
//                    //  --------- end of cart icon -----------------
//                    Spacer().frame(width:8)
                    //  --------- start of fav icon -----------------
                    Button(action: {
                        print(String("setting is clicked"))
                    })
                    {
                        HStack {
                            Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                        }
                        .padding(15)
                        .frame(width: 50, height: 40)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                    }
                    //  --------- end of fav icon -----------------
                       Spacer().frame(width: 24.0)
                }.padding(.bottom, 16)
                   .padding(.top, 16)
                    HStack{
                if(self.searchTapped){

                }
                    }
                }
        
        
        
        
        
        
        
        
    }
}

