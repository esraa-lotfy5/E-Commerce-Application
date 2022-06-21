//
//  NavigationHome.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 6/1/22.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct NavigationHome : View {
    @State private var searchHomeTapped = false
    @State private var isActive = false
    @State private var isActive2 = false

    //trial
    @ObservedObject  var viewModel = HomeViewModel()
    @ObservedObject  var viewModelDiscount = DiscountCodeViewModel()
    
    
    var body : some View {

        VStack{
                    HStack {
                   
                       Spacer().frame(width: 24.0)

                        
                           HStack {
                               Image(systemName: "gearshape")
                                   .foregroundColor(.black)
                           }
                           .onTapGesture {

                            self.isActive.toggle()
                           } // activate link on image tap
                            .background(NavigationLink(destination:  SettingsView(), isActive: $isActive)
                            { EmptyView() }                    .navigationBarBackButtonHidden(true)
)
                           
                           .padding(15)
                           .frame(width: 50, height: 40)
                           .background(Color.white)
                           .cornerRadius(10)
                           .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                       
                    //  ------------ end of search icon --------------------
                       Spacer()
                    //  ------------- start of header text --------------------------
                       Text("Home")
                           .fontWeight(.bold)
                    //  ------------ end of header text --------------------
                       Spacer()
                    Spacer().frame(width:8)
                    //  --------- start of fav icon -----------------
                        HStack {
                            Image(systemName: "tag")
                                .foregroundColor(.black)
                        }
                        .onTapGesture {
                         self.isActive2.toggle()
                        } // activate link on image tap
                         .background(NavigationLink(destination:  DiscountCodeView(), isActive: $isActive2)
                         { EmptyView() }                    .navigationBarBackButtonHidden(true)
)
                        
                        .padding(25)
                        .frame(width: 50, height: 40)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                        //Spacer()
                        
                        
                        
                        
//                    //
//                    Button(action: {
//                        print(String("discountcode is clicked"))
////                        if(self.searchHomeTapped){
////                                           self.searchHomeTapped = false
////                                       }else{
////                                           self.searchHomeTapped = true
////                                       }
//
//                        self.isActive.toggle()
//
//                    }
//
//                    )
//                    {
//                        HStack {
//                            Image(systemName: "tag")
//                            .foregroundColor(.black)
//                        }
//                        .padding(15)
//                        .frame(width: 50, height: 40)
//                        .background(Color.white)
//                        .cornerRadius(10)
//                        .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
//                    }
//                    //  --------- end of fav icon -----------------
                       Spacer().frame(width: 24.0)
//                }.padding(.bottom, 16)
//                   .padding(.top, 16)
//                    HStack{
////                if(self.searchHomeTapped){
////
////                    SearchBarIcon()
////                }
//                    }
                }
        
        
        
        
        
        
        
        
    }
}

}
