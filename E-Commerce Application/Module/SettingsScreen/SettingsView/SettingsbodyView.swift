//
//  SettingsbodyView.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 6/1/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import SwiftUI

struct SettingsBodyView: View {
    
    @ State private var currencyItem = ["EGP","USD"]
    @ State private var selection = 0
    @ State private var pickerVisible = false
    @ State private var count = 0
    
    var body: some View {

        VStack(alignment: .leading){
            //address
            HStack{
                Button(action: {
                    print("address is clicked")
                    
                    
                    
                    
                }){
                    Image(systemName: "location.fill").resizable().frame(width: 30, height: 30).foregroundColor(Color.black.opacity(0.2)).padding(.leading)
                        
                    
                    Text("Address")
                        .font(.body)
                        .foregroundColor(.black)
                    .padding()
                    Spacer()
                    

                    
                }
            }
            Divider()
//            }.frame(width: 420, height: 50, alignment: .leading)
//            .background(Color.white)
//            .cornerRadius(10)
//            .border(Color.gray)
                
            //currency
            HStack{
                Button(action: {
                    print("currency is clicked")
                    
                    //trial
                    if self.pickerVisible {
                        self.count += 1
                    }
                    self.pickerVisible.toggle()

                    
                }){
                    Image(systemName: "creditcard").resizable().frame(width: 30, height: 30).foregroundColor(Color.black.opacity(0.2)).padding(.leading)
                    
                    Text("Currency")
                        .font(.body)
                        .foregroundColor(.black)
                    .padding()

                    }
                
                if pickerVisible {
                    HStack{
                        Spacer()
                        Picker(selection: $selection, label: Text("")) {
                            ForEach(0..<currencyItem.count){
                                Text(self.currencyItem[$0])
                            }
                        }
                        .onTapGesture {
                            self.count += 1
                            self.pickerVisible.toggle()
                        }
                        Spacer()
                    }
                }
                   
            }
            
            Divider()
//            .frame(width: 420, height: 50, alignment: .leading)
//            .background(Color.white)
//            .cornerRadius(10)
//            .border(Color.gray)
            
            //contact us
            HStack{
                Button(action: {
                    print("contact us  is clicked")
                }){
                    Image(systemName: "phone.fill").resizable().frame(width: 30, height: 30).foregroundColor(Color.black.opacity(0.2))
                        .padding(.leading)
                    
                    Text("Contact Us")
                        .font(.body)
                        .foregroundColor(.black)
                    .padding()
                    
                }
            }
                        Divider()
            //            .frame(width: 420, height: 50, alignment: .leading)
            //            .background(Color.white)
            //            .cornerRadius(10)
            //            .border(Color.gray)
            //about us
            HStack{
                Button(action: {
                    print("about us  is clicked")
                }){
                    Image(systemName: "info.circle").resizable().frame(width: 30, height: 30).foregroundColor(Color.black.opacity(0.2)).padding(.leading)
                    
                    Text("About Us")
                        .font(.body)
                        .foregroundColor(.black)
                    .padding()
                    
                }
            }
                        Divider()
            //            .frame(width: 420, height: 50, alignment: .leading)
            //            .background(Color.white)
            //            .cornerRadius(10)
            //            .border(Color.gray)
            //logout
            HStack{
                Button(action: {
                    print("logout  is clicked")
                }){
                    Image(systemName: "multiply.circle").resizable().frame(width: 30, height: 30).foregroundColor(Color.black.opacity(0.2))
                        .padding(.leading)
                    
                    Text("Logout")
                        .font(.body)
                        .foregroundColor(.black)
                    .padding()
                    
                }
            
            }
            Divider()
            
           
            


            //            .frame(width: 420, height: 50, alignment: .leading)
            //            .background(Color.white)
            //            .cornerRadius(10)
            //            .border(Color.gray)
            


                
        }
    



    }
}








