//
//  PlaceOrders.swift
//  E-Commerce Application
//
//  Created by Aya Abdelraouf on 08/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

import StepperView
import BraintreeDropIn


struct PlaceOrders: View {
    
    let steps = [
        TextView(text: " \(" ") Address", font: Font.system(size: 12, weight: Font.Weight.regular)),
        TextView(text: " \(" ") Payment Options", font: Font.system(size: 12, weight: Font.Weight.regular)),
        TextView(text: " \(" ") Order", font: Font.system(size: 12, weight: Font.Weight.regular))
    ]
    
    let indicators = [
        StepperIndicationType.custom(Image(systemName:"1.circle.fill").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image(systemName:"2.circle.fill").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image(systemName:"3.circle.fill").font(.largeTitle).eraseToAnyView())
    ]
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var cobon = ""
    @State var subTotal : Double = 976.0
    @State var shippingFees : Double = 30.0
    @State var validation : String = "Validate"
    @State var discound : Double = 0.0
    @State var total : Double = 1006.0
    
    
    
    let tokenizationKey = "sandbox_rzw4gpvr_d4c5wgkkpdhthsgg"
    var amountInt :Int = 1
    var amount : NSDecimalNumber = 1000000
    
    @State var showDropIn = false
    
    var body: some View {
        let size = Decimal(amountInt)
        let test = pow(size, 2) - 1
        let resultD = NSDecimalNumber(decimal: test)
        
        VStack {
            
            
            Spacer()
            StepsC(steps: steps, indicators: indicators)
            
            Spacer()
            Spacer()
            
            
            VStack(alignment: .leading){
                Spacer()
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
                
                Spacer()
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
                            
                            NavigationLink(destination: Text("")) {
                                
                                Button(action: { self.showDropIn = true }) {
                                    HStack {
                                        Spacer()
                                        Text("Select Payment Method")
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
                            }.edgesIgnoringSafeArea(.vertical)
                            
                            
                            
                            
                        }.frame(height:200)
                    }
                    
                }
                
                
            }
            
            
            
            
            
        }.navigationBarBackButtonHidden(true)
        
        //////////
        
        
        
        if self.showDropIn {
            BTDropInRepresentable(authorization: tokenizationKey, amount: resultD,handler: { controller, result, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if result != nil{
                    // Update your UI
                    let type = result?.paymentMethodType
                    let icon = result?.paymentIcon
                    let description = result?.paymentDescription
                    
                    // Use the payment method to transact
                    let paymentMethod = result?.paymentMethod
                    print("\(String(describing: type))🎲")
                    print("\(String(describing: paymentMethod))🎲")
                    print("\(String(describing: description))🎲")
                    
                } else {
                    print("Ready for checkout...")
                }
                self.showDropIn = false
            }).edgesIgnoringSafeArea(.vertical)
        }
        
        
    }
    
    
    
}




struct BTDropInRepresentable: UIViewControllerRepresentable {
    var authorization: String
    var handler: BTDropInControllerHandler
    var amount : NSDecimalNumber
    
    init(authorization: String,amount :NSDecimalNumber, handler: @escaping BTDropInControllerHandler) {
        self.authorization = authorization
        self.handler = handler
        self.amount = amount
    }
    
    func makeUIViewController(context: Context) -> BTDropInController {
        
        let request = BTDropInRequest()
        
        let threeDSecureRequest = BTThreeDSecureRequest()
        
        threeDSecureRequest.amount = amount
        
        request.threeDSecureRequest = threeDSecureRequest
        
        request.vaultManager = true
        
        
        
        
        let bTDropInController = BTDropInController(authorization: authorization, request: request, handler: handler)!
        
        
        return bTDropInController
    }
    
    func updateUIViewController(_ uiViewController: BTDropInController, context: UIViewControllerRepresentableContext<BTDropInRepresentable>) {
    }
}
