//
//  ProductDetailsWishList.swift
//  TrySwiftUI
//
//  Created by NourAllah Ahmed on 5/30/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//

import SwiftUI
//struct ProductDetailsWishList: View {
//    @State var product : DraftOrder
//    //trial
//  //  @State var product : DraftOrder
//    @Binding var productPrice : Double
//    
////    @State public var total : Double  = 1.0
//    
//    var body: some View {
//        HStack {
//            VStack(alignment: .leading){
//                Text("Name: \(product.lineItems?[0].name ?? "")")
//                //Text("name : \(product.name ?? "")")
//                    .foregroundColor(.black)
//                    .font(.headline)
//                    .padding(.top)
//                //MARK: Size
//                Text("Type: \(product.lineItems?[0].sku ?? "")")
//               // Text("size : \(product.name ?? "")")
//                    .foregroundColor(.black)
//                    .font(.headline)
//                    .padding(.bottom)
//                
//                Text("Vendor: \(product.lineItems?[0].vendor ?? "")")
//               // Text("vendor : \(product.name ?? "")")
//                    .foregroundColor(.black)
//                    .font(.headline)
//                    .padding(.bottom)
//                    .lineLimit(2)
//                Spacer()
//
//            }
//            Spacer()
//
//            //MARK: Price
//            VStack (alignment: .trailing ){
//                Spacer()
//
//                Text("Price: \(productPrice) ")
//                    .foregroundColor(.blue)
//                    .font(.headline)
//                    .padding(.all)
//                
//            }
//        }
//    }
// 
//}
//
//
//
//
//
////                        self.changePrice(price: (product.price)! * total
////                product.price = product.price! * total
////                Section{
////                    Stepper.init("", onIncrement: {
////                        self.total += 1
////                        self.product.price! += self.product.price!
////                    }, onDecrement: {
////                        self.total -= 1
////                        if self.total != 0 {
//////                            self.totalPrice  -=  Int(self.product.price!)
////
////                            self.product.price! -=  self.product.price!
////
////                        }
////
////
////                    })
////
////                }
//
//
////struct ProductDetailsWishList_Previews: PreviewProvider {
////    static var previews: some View {
////        ProductDetailsWishList(product: Product(), productPrice: nil)
////    }
////}
