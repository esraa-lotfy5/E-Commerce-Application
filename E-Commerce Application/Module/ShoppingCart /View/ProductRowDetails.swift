//
//  ProductRowDetails.swift
//  E-Commerce
//
//  Created by NourAllah Ahmed on 5/29/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//
import SwiftUI
struct ProductRowDetails: View {
    @State var product : DraftOrder

    
//    @State public var total : Float  = 1.0
    @State private var IsEgp : Bool?

    @State private var Egp = UserDefaults.standard.float(forKey: "EGP")
    @State private var usd = UserDefaults.standard.float(forKey: "USD")
    @State var currencyString = UserDefaults.standard.string(forKey: "options")
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text("Vendor: \(product.lineItems?.first?.vendor ?? "nil")")
                    .foregroundColor(.black)
                    .font(.headline)
                    .padding(.top)
                
                
                Text("Product: \(product.lineItems?.first?.name ?? "nil")")
                    .foregroundColor(.black)
                    .lineLimit(5)
                    .font(.headline)
                    .padding(.top)
                
                //MARK: Size
                Text("Size: \(product.noteAttributes?.last?.value ?? "nil")")
                    .foregroundColor(.black)
                    .font(.headline)
                    .padding(5)
                
//                Text("quantity: \(product.lineItems?.first?.quantity ?? 0)")
//                    .foregroundColor(.black)
//                    .font(.headline)
//                    .padding(5)
//
                
//
                //MARK: Price
           
                
                if IsEgp ?? true {
                    Text("\((Float(product.lineItems?.first?.price ?? "0.0"))!, specifier: "%.2f")  USD ") .foregroundColor(.black)
                        .padding(5)

                        .font(.headline)
                }
                else{
                    Text("\((Float(product.lineItems?.first?.price ?? "0.0"))!  / Egp , specifier: "%.2f")  USD ") .foregroundColor(.black)
                        .padding(5)
                        .font(.headline)
                    
                    
                }
                
              
                                
            }.onAppear{
                

                self.IsEgp = UserDefaults.standard.bool(forKey: "isEGP")

            }
            Spacer()
        }
    }
 
}





//                        self.changePrice(price: (product.price)! * total
//                product.price = product.price! * total
//                Section{
//                    Stepper.init("", onIncrement: {
//                        self.total += 1
//                        self.product.price! += self.product.price!
//                    }, onDecrement: {
//                        self.total -= 1
//                        if self.total != 0 {
////                            self.totalPrice  -=  Int(self.product.price!)
//
//                            self.product.price! -=  self.product.price!
//
//                        }
//
//
//                    })
//
//                }
