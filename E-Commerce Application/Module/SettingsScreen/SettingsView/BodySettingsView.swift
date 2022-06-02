//
//  BodySettingsView.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 6/2/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import SwiftUI

struct BodySettingsView : View{
private var currencyArr = ["EGP", "USD"]
@State private var selectedIndex = 0


var body: some View{
        NavigationView {
            Form {
                Section {
                    
                    //start of element location
                    HStack{
                        Image(systemName: "location.fill")
                        .frame(width: 25, height: 25)
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        Button(action: {
                            print("location is clicked")
                        }, label: {
                            Text("Choose Location")
                        })
                            .foregroundColor(Color.black)
                        
                    }
                    //end of element

                    
                    
                    //start of element currency
                    HStack{
                        Image(systemName: "creditcard")
                        .frame(width: 25, height: 25)
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                          Picker(selection: $selectedIndex, label:
                              Text("choose currency")
                          ) {
                              ForEach(0 ..< currencyArr.count) {
                                  Text(self.currencyArr[$0])
                              }
                        }
                          //end of picker
                    }
                    //end of element

                    
                    
                    
             }
                
                Section{
                    //start of element contact us
                    HStack{
                        Image(systemName: "phone.fill")
                        .frame(width: 25, height: 25)
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        Button(action: {
                            print("contact us is clicked")
                        }, label: {
                            Text("Contact Us")
                        })
                            .foregroundColor(Color.black)
                        
                    }
                    //end of element
                    
                    //start of element about us
                    HStack{
                        Image(systemName: "info.circle")
                        .frame(width: 25, height: 25)
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        Button(action: {
                            print("about us is clicked")
                        }, label: {
                            Text("About Us")
                        })
                            .foregroundColor(Color.black)
                        
                    }
                    //end of element
                    
                    
                }
                
                Section{
                    //start of element logout
                    HStack{
                        Image(systemName: "multiply.circle")
                        .frame(width: 25, height: 25)
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        Button(action: {
                            print("logout is clicked")
                        }, label: {
                            Text("Logout")
                        })
                            .foregroundColor(Color.red)
                    }
                    //end of element
                }
                
            
                
        }
    }
    

    }
    
    
    
}


