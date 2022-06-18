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
    //trial
    @ObservedObject  var viewModel = HomeViewModel()
    @ObservedObject  var viewModelDiscount = DiscountCodeViewModel()
    
    
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
//                       Button(action: {
//                            print(String("settings is clicked"))
////                        if(self.searchTapped){
////                            self.searchTapped = false
////                        }else{
////                            self.searchTapped = true
////                        }
//                       })
//                       {
                        
                           HStack {
                               Image(systemName: "gear")
                                   .foregroundColor(.black)
                           }
                           .onTapGesture {
                               //trial post price rule 
//                               let priceRuleObj = [
//                                   "price_rule": [
//                                                "title": "OPENING45OFF",
//                                                "target_type": "line_item",
//                                                "target_selection": "all",
//                                                "allocation_method": "across",
//                                                "value_type": "fixed_amount",
//                                                "value": "-45.0",
//                                                "customer_selection": "all",
//                                                "starts_at": "2021-11-10T13:00:10Z"
//                                   ]
//                               ]
//                               let priceRuleObjTwo = [
//                                   "price_rule": [
//                                                "title": "SALE15OFF",
//                                                "target_type": "line_item",
//                                                "target_selection": "all",
//                                                "allocation_method": "across",
//                                                "value_type": "fixed_amount",
//                                                "value": "-15.0",
//                                                "customer_selection": "all",
//                                                "starts_at": "2021-11-10T13:00:10Z"
//                                   ]
//                               ]
//                               viewModel.postPriceRule(priceRule: priceRuleObjTwo)
                               
                               //post discount code
//                               let discountCodeObj = [
//                                   "discount_code": [
//                                       "code": "SALE15OFF"
//                                   ]
//                               ]
//
//                               let discountCodeObjTwo = [
//                                   "discount_code": [
//                                       "code": "OPENING45OFF"
//                                   ]
//                               ]
//
//                               viewModel.postDiscountCode(discountCode: discountCodeObjTwo)
                               

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
                    Spacer().frame(width:8)
                    //  --------- start of fav icon -----------------
                        HStack {
                            Image(systemName: "tag")
                                .foregroundColor(.black)
                        }
                        .onTapGesture {
                         self.isActive.toggle()
                        } // activate link on image tap
                         .background(NavigationLink(destination:  DiscountCodeView(), isActive: $isActive)
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
