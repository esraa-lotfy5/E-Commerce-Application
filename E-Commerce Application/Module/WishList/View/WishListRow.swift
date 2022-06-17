//
//  WishListRow.swift
//  TrySwiftUI
//
//  Created by NourAllah Ahmed on 5/30/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//

import SwiftUI
import Kingfisher

//struct WishListRow: View {
//   // var product : Product3
//    var product : DraftOrder
//    
//    @Binding var productPrice : Double
//    @State var checked = false
//    
//    var body: some View {
//        
//        VStack{
//            HStack{
//                //MARK: Image
//                let imgUrl = product.noteAttributes?[0].value
//                WishListProductImage(imageName: imgUrl ?? "")
//                VStack{
//                    ProductDetailsWishList(product: product, productPrice: $productPrice )
//                }
//            }
//            .background(Color.blue.opacity(0.10))
//            .cornerRadius(15)
//        }
//    .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
//        
//    }
//}
//
//
//
////MARK:- >>>>>>>> Product Image <<<<<<<<<<<<
//struct WishListProductImage: View {
//    var imageName :String
//    var body: some View {
//        KFImage(URL(string: imageName))
//        //Image(imageName)
//            .resizable()
//            .cornerRadius(15)
//            .frame(width: 100, height: 150)
//            .scaledToFit()
//            .padding()
//        
//    }
//}
//
//            
////            HStack{
////                Section{
////                    Button(action: {
////                        if(self.checked == true) { self.checked = false}
////                        else { self.checked = true }
////
////                    }){
////                        if self.checked == true {
////                            Image(systemName: "heart.fill")
////                                .foregroundColor(Color.red)
////                                .padding(.all)
////                        } else {
////                            Image(systemName: "heart")
////                                .padding(.all)
////                        }
////
////                    }
////                }
////            }
