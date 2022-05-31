//
//  PaymentScreens.swift
//  E-Commerce Application
//
//  Created by Aya Abdelraouf on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

import StepperView
struct PaymentScreen: View {
    
    let steps = [
        TextView(text: "Address", font: Font.system(size: 12, weight: Font.Weight.regular )),
        TextView(text: "Payment Options", font: Font.system(size: 12, weight: Font.Weight.regular)),
        TextView(text: "Order", font: Font.system(size: 12, weight: Font.Weight.regular))
    ]
    
    let indicators = [
        StepperIndicationType.custom(Image(systemName:"1.circle.fill").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image(systemName:"2.circle").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image(systemName:"3.circle").font(.largeTitle).eraseToAnyView())
    ]
    
    var addressess : [Address]
    @State var  name : String = ""
    @State var address :String = ""
    @State var city :String = ""
    @State var state :String = ""
    
    let colorGray = Color(red: 232/255, green: 232/255, blue: 232/255)
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                VStack {
                    
                    StepsC(steps: steps, indicators: indicators)
                    
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        
                        HStack(alignment :.top,spacing: 10){
                            ForEach(addressess){ address in
                                AddressItem(address: address)
                            }
                        }.padding()
                    }
                }
                
                VStack(alignment:.leading) {
                    
                    Text("Name")
                        .padding(.leading)
                        .foregroundColor(.black)
                    TextField("", text: $name)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 30)
                    Divider()
                        .padding(.horizontal, 30)
                        .padding(.bottom)
                    
                    VStack(alignment:.leading) {
                        Text("Address")
                            .padding(.leading)
                            .foregroundColor(.black)
                        TextField("", text: $address)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 30)
                        Divider()
                            .padding(.horizontal, 30)
                            .padding(.bottom)
                    }
                    
                    VStack(alignment:.leading){
                        Text("City")
                            .padding(.leading)
                            .foregroundColor(.black)
                        TextField("", text: $city)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 30)
                        Divider()
                            .padding(.horizontal, 30)
                            .padding(.bottom)
                    }
                    
                    VStack(alignment:.leading) {
                        Text("State")
                            .padding(.leading)
                            .foregroundColor(.black)
                        TextField("", text: $state)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 30)
                        Divider()
                            .padding(.horizontal, 30)
                            .padding(.bottom)
                        
                    }
                    
                    Spacer()
                }
                
                Spacer()
                NavigationLink(destination: PaymentOptions()) {
                    Text("Next").colorScheme(.dark)
                    
                    
                }
            }
            
        }
        
        
    }
}



struct PaymentOptions: View {
    @State private var paymentIndex = 0
    
    var paymentsOptions = ["Apple Pay","Cash On Delivery"]
    
    let steps = [
        TextView(text: "Address", font: Font.system(size: 12, weight: Font.Weight.regular)),
        TextView(text: "Payment Options", font: Font.system(size: 12, weight: Font.Weight.regular)),
        TextView(text: "Order", font: Font.system(size: 12, weight: Font.Weight.regular))
    ]
    
    let indicators = [
        StepperIndicationType.custom(Image(systemName:"1.circle.fill").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image(systemName:"2.circle.fill").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image(systemName:"3.circle").font(.largeTitle).eraseToAnyView())
    ]
    var body: some View {
        
        VStack {
            Spacer()
            StepsC(steps: steps, indicators: indicators)
            
            Spacer()
            
            
            Picker(selection:$paymentIndex, label: Text("Payments")) {
                ForEach (0 ..< paymentsOptions.count){
                    Text(self.paymentsOptions[$0]).tag($0)
                }
            }
            
            
            
            
            Spacer()
            Spacer()
            Spacer()
            NavigationLink(destination: OrderPayments()) {
                Text("Next")
            }
            Spacer()
        }
        
        
        
    }
}

struct OrderPayments: View {
    let steps = [
        TextView(text: "Address", font: Font.system(size: 12, weight: Font.Weight.regular)),
        TextView(text: "Payment Options", font: Font.system(size: 12, weight: Font.Weight.regular)),
        TextView(text: "Order", font: Font.system(size: 12, weight: Font.Weight.regular))
    ]
    
    let indicators = [
        StepperIndicationType.custom(Image(systemName:"1.circle.fill").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image(systemName:"2.circle.fill").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image(systemName:"3.circle.fill").font(.largeTitle).eraseToAnyView())
    ]
    @State private var cobon = ""
    @State var subTotal : Double = 976.0
    @State var shippingFees : Double = 30.0
    @State var validation : String = "Validate"
    @State var discound : Double = 0.0
    @State var total : Double = 1006.0
    
    
    var body: some View {
        
        
        
        
        VStack {
            Spacer()
            StepsC(steps: steps, indicators: indicators)
            Spacer()
            
            VStack{
                Form{
                    Section{
                        HStack{
                            Text("Sub Total")
                            Spacer()
                            Text("\(subTotal) USD")
                            
                        }}.padding()
                    Section{
                        HStack{
                            Text("Shipping Fees")
                            Spacer()
                            Text("\(shippingFees) USD")
                        }
                    }.padding()
                    Section{
                        HStack{
                            TextField("Cobon",text: $cobon)
                            Spacer()
                            Text(validation)
                        }
                    }.padding()
                    Section{
                        HStack{
                            Text("Discount")
                            Spacer()
                            Text("\(discound)USD")
                        }
                    }.padding()
                    
                    Section{
                        HStack{
                            Text("Grand Total")
                            Spacer()
                            Text("\(total) USD")
                            //                        Text(String(format: "%.2f", total))
                        }
                    }
                }.padding()
                
                
            }
            
            //////////
            NavigationLink(destination: Text("")) {
                Text("Placce Order")
            }
            Spacer()
        }
        
        
        
    }
}

struct StepsV: View {
    var steps : [Text]
    
    
    var indicationTypes : [StepperIndicationType<NumberedCircleView>]
    
    var body: some View {
        StepperView()
            .addSteps(steps)
            .indicators(indicationTypes)
            .stepIndicatorMode(StepperMode.horizontal)
            .spacing(30)
            .lineOptions(StepperLineOptions.custom(1, Colors.blue(.teal).rawValue))    }
}

struct StepsC: View {
    var steps : [TextView]
    
    var indicators :[StepperIndicationType<AnyView>]
    
    var body: some View {
        StepperView()
            .addSteps(steps)
            .indicators(indicators)
            .stepIndicatorMode(StepperMode.horizontal)
            .lineOptions(StepperLineOptions.rounded(4, 8, Color.black))
            .stepLifeCycles([StepLifeCycle.completed, .completed, .completed, .pending])
            .spacing(50)}
}

struct PaymentScreen_Previews: PreviewProvider {
    static var previews: some View {
        PaymentScreen(addressess: [Address(id: 1, name: "My home #1", address: "438 Dark Suprt Avenune ", city: " San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),Address(id: 2, name: "My home #2", address: "438 Dark Suprt Avenune ", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),Address(id: 3, name: "My home #3", address: "438 Dark Suprt Avenune ", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),Address(id: 4, name: "My home #4", address: "438 Dark Suprt Avenune ", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),Address(id: 5, name: "My home #4", address: "438 Dark Suprt Avenune ", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),Address(id: 6, name: "My home #5", address: "438 Dark Suprt Avenune , San Francisco ,CA, 94528", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),Address(id: 7, name: "My home #6", address: "438 Dark Suprt Avenune , San Francisco ,CA, 94528", city: "city", zipCode: 112, state: "state", defultShippingAddress: false)] )
    }
}
