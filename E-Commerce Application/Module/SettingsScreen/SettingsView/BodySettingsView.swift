//
//  BodySettingsView.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 6/2/22.
//  Copyright © 2022 iti. All rights reserved.
//
import Foundation
import SwiftUI



enum CurrencyType: String, CaseIterable {
    case EGP = "EGP"
    case USD = "USD"
    
}




struct BodySettingsView : View{

@State var currencyArr :[CurrencyType] = [.EGP , .USD]
@State var currencyIndex = 1

@State private var currencyString = UserDefaults.standard.string(forKey: "currencyString")
@State private var currencyValue = UserDefaults.standard.float(forKey: "currencyValue")
    
    @State private var selectedIndex = 0
    


    
@ObservedObject  var vm = SettingsViewModel()
@State var active :Bool = false

var body: some View{
    
      
            
            
            Form {
                Section {
                    
                  
                    
                    
                    //start of element currency
                    VStack{
                        
                        HStack {
                            Text(" choose Currency ")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.secondary)
                            Spacer()
                        }
                        Picker(selection: $vm.currencyType, label: Text("currencyType"), content: {
                            Text("EGP").tag(CurrencyType.EGP)
                            Text("USD").tag(CurrencyType.USD)
                            
                        })
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    .padding(.top, 20)
                }
                    
                    
                    //end of element
                    
                    
             
                
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
                        
                        NavigationLink(destination: LoginScreen(),isActive: $active) {
                         EmptyView()
                        }
                        Button(action: {
                            print("logout is clicked")
                            isloggedOut()
                            self.active = true
               
                        }, label: {
                            Text("Logout")
                        })
                            .foregroundColor(Color.red)
                    }
                    //end of element
                }
                
            
                
        }
    
    

    }
    func isloggedOut (){
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        UserDefaults.standard.set("", forKey: "id")
        UserDefaults.standard.set("", forKey: "email")
        UserDefaults.standard.set("", forKey: "first_name")
        UserDefaults.standard.set("", forKey: "last_name")
        
    }
    
    
}
