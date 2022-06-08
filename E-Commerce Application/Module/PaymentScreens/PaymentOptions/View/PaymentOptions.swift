//
//  PaymentOptions.swift
//  E-Commerce Application
//
//  Created by Aya Abdelraouf on 08/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI
import StepperView


struct PaymentOptions: View {
    @State private var paymentIndex = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            
            StepsC(steps: steps, indicators: indicators)
            
            
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            
            
            
            
            
            Picker(selection:$paymentIndex, label: Text("Payments")) {
                ForEach (0 ..< paymentsOptions.count){
                    Text(self.paymentsOptions[$0]).tag($0)
                }
            }
            .padding(.leading, 10)
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
                        
                        NavigationLink(destination: PlaceOrders(),isActive: $active) {
                            
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
            
            
        }
        
        
        
    }
    
    
    
}

