//
//  PaymentOptions.swift
//  E-Commerce Application
//
//  Created by Aya Abdelraouf on 08/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI
import StepperView


enum PaymentType: String, CaseIterable {
    case PayPal = "PayPal"
    case CashOnDeleviry = "Cash"
    
}



struct PaymentOptions: View {
  //  @State private var currencyString = UserDefaults.standard.string(forKey: "PaymentOptions")
    @State var optionsArr :[PaymentType] = [.CashOnDeleviry, .PayPal]
    @State var optionsIndex = 1
    @ObservedObject  var vm = PaymentOptionViewModel()
    
    @State private var paymentIndex = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var shoppingCartViewModel : ShoppingCartViewModel

    var paymentsOptions = ["PayPal","Cash On Delivery"]
    let steps = [
        TextView(text: " \(" ") Address", font: Font.system(size: 12, weight: Font.Weight.regular)),
        TextView(text: " \(" ") Payment Options", font: Font.system(size: 12, weight: Font.Weight.regular)),
        TextView(text: " \(" ") Order", font: Font.system(size: 12, weight: Font.Weight.regular))
    ]
    
    let indicators = [
        StepperIndicationType.custom(Image(systemName:"1.circle.fill").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image(systemName:"2.circle.fill").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image(systemName:"3.circle").font(.largeTitle).eraseToAnyView())
        
    ]
    
    
    @State var active :Bool = false
    @State var payment :Double = 0.0
    var body: some View {
        
        VStack {
            
            Spacer()
            
            
            StepsC(steps: steps, indicators: indicators)
            
            
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            
            
            
            
            Form {
                Section {
                    
                  
                    
                    
                    //start of element currency
                    VStack{
                        
                        Toggle(isOn: $vm.PaymentOptionsActivate) {
                                        Text("Active")
                                            .font(.system(size: 18))
                                            .foregroundColor(Color("TextDark"))
                           // print("value :\()")
                                    }
                                    .padding(.top, 6)
                        
                    HStack{
                        Image(systemName: "creditcard")
                        .frame(width: 25, height: 25)
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        
                        Picker("chooseCurrency", selection: $vm.setUserDefault) {
                            ForEach(self.optionsArr, id: \.self) { value in
                                Text(value.rawValue).tag(value)
                                       }
                                   }
                                   .pickerStyle(SegmentedPickerStyle())
                        
                      //end of picker
                    }
                }
                    
                    
                    //end of element

                    
                    
                }}
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
                        
                        NavigationLink(destination: PlaceOrders().environmentObject(self.shoppingCartViewModel),isActive: $active) {
                            
                            EmptyView()
                        }.edgesIgnoringSafeArea(.vertical)
                        
                        Button(action: {
                            
                            active = true
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
                
            }.navigationBarBackButtonHidden(true)
                .environmentObject(shoppingCartViewModel)
                .onAppear{
                    print("______PAYMENT________")
                    payment = self.shoppingCartViewModel.totalPrice
                    print(self.payment)
                }
            
        }.onAppear{
            print("______PAYMENT________")
            payment = self.shoppingCartViewModel.totalPrice
            print(self.payment)
        }
        
        
        
        
    }
    
    
    
}

