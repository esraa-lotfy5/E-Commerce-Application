//
//  AddressScreen.swift
//  E-Commerce Application
//
//  Created by Aya Abdelraouf on 08/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI
import StepperView
import BraintreeDropIn

struct AddressScreen: View {
    
    let steps = [
        TextView(text: " \(" ") Address", font: Font.system(size: 12, weight: Font.Weight.regular )),
        TextView(text: " \(" ") Payment Options", font: Font.system(size: 12, weight: Font.Weight.regular)),
        TextView(text: "\(" ") Order", font: Font.system(size: 12, weight: Font.Weight.regular))
    ]
    
    let indicators = [
        StepperIndicationType.custom(Image(systemName:"1.circle.fill").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image(systemName:"2.circle").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image(systemName:"3.circle").font(.largeTitle).eraseToAnyView())
    ]
    
    var addressess : [FakeAddress]
    @State var  name : String = ""
    @State var address :String = ""
    @State var city :String = ""
    @State var state :String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    let colorGray = Color(red: 232/255, green: 232/255, blue: 232/255)
    
    //view Model
    
    @ObservedObject  var vm = AddressViewModel()
    
    @State var active :Bool = false
    
    
    var body: some View {
        
        
        VStack {
            
            
            Spacer()
            StepsC(steps: steps, indicators: indicators)
            Spacer()
            
            ScrollView(.horizontal,showsIndicators: false){
                
                HStack(alignment :.top,spacing: 10){
                    ForEach(vm.comingAddressess){ address in
                        AddressItem(address: address)
                    }
                }.padding()
            }
            VStack {
                
                
                TextField("Name", text: self.$name)
                    .padding()
                    .padding(.bottom, -25)
                    .foregroundColor(Color.blue)
                
                Divider().padding()
                
                TextField("Address", text: self.$address)
                    .padding()
                    .padding(.bottom, -15)
                    .foregroundColor(Color.blue)
                
                Divider().padding().padding(.top, -15)
                
                TextField("City", text: self.$city)
                    .padding()
                    .padding(.bottom, -15)
                    .foregroundColor(Color.blue)
                
                Divider().padding().padding(.top, -15)
                
                TextField("State", text: self.$state)
                    .padding()
                    .padding(.bottom, -15)
                    .foregroundColor(Color.blue)
                
                Divider().padding().padding(.top, -15)
                
            }
            
            
            
            Spacer()
            
            
            VStack {
                VStack {
                    HStack (alignment: .top, spacing: 0){
                        //MARK:- back button
                        Spacer().frame(width:10)
                        HStack{
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                        }
                        .onTapGesture {
                            self.presentationMode.wrappedValue.dismiss()
                            
                        }
                        .frame(width: 50, height: 40)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                        Spacer().frame(width:50)
                        
                        NavigationLink(destination: PaymentOptions(),isActive: $active) {
                            
                            EmptyView()
                        }.edgesIgnoringSafeArea(.vertical)
                        
                        Button(action: {
                            let addressPar  = [
                                
                                "address" :[
                                    
                                    "address1": address,
                                    "city": city,
                                    "country": state
                                    
                                    
                                ]
                                
                            ]
                            print(addressPar)
                            vm.postApi(address: addressPar)
                            self.active = true
                            
                            
                        }) {
                            HStack {
                                Spacer()
                                Text("Next")
                                    .fontWeight(.bold)
                                    .font(.body)
                                Spacer()
                            }
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .background(Color.accentColor)
                            .cornerRadius(15)
                        }
                        
                        Spacer()
                        
                        
                        
                        
                        
                    }.frame(height:200)
                }
                
            }.navigationBarBackButtonHidden(true).onAppear {
                
                vm.getAddress()
                
            }
            
        }
    }
    
}
