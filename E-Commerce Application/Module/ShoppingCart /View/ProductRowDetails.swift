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

    @Binding var productPrice : Double
    
    @State public var total : Double  = 1.0
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text("\(product.lineItems?.first?.name ?? "nil")")
                    .foregroundColor(.black)
                    .font(.headline)
                    .padding(.top)
                //MARK: Size
                Text("Size: \(product.status ?? "nil")")
                    .foregroundColor(.black)
                    .font(.headline)
                    .padding(.bottom)
                
                Text("quantity: \(product.lineItems?.first?.quantity ?? 0)")
                    .foregroundColor(.black)
                    .font(.headline)
                    .padding(.bottom)
                    .lineLimit(2)
            }
            Spacer()
            //MARK: Price
            VStack (alignment: .trailing ){
                Text("\((Double(product.lineItems?.first?.price ?? "0.0")! * total ).description)")
                    .foregroundColor(.blue)
                    .font(.headline)
                    .padding(.all)
                
            }
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
