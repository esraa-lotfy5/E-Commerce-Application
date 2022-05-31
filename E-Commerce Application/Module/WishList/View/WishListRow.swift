//
//  WishListRow.swift
//  TrySwiftUI
//
//  Created by NourAllah Ahmed on 5/30/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//

import SwiftUI

struct WishListRow: View {
    var product : Product
    
    @Binding var productPrice : Double
    @State var checked = false
    
    var body: some View {
        
        VStack{
            HStack{
                //MARK: Image
                WishListProductImage(imageName: "G")
                VStack{
                    ProductDetailsWishList(product: product, productPrice: $productPrice )
                }
            }
            .background(Color.blue.opacity(0.10))
            .cornerRadius(15)
        }
        
    }
}



//MARK:- >>>>>>>> Product Image <<<<<<<<<<<<
struct WishListProductImage: View {
    var imageName :String
    var body: some View {
        Image(imageName)
            .resizable()
            .cornerRadius(15)
            .frame(width: 100, height: 150)
            .scaledToFit()
            .padding()
        
    }
}

            
//            HStack{
//                Section{
//                    Button(action: {
//                        if(self.checked == true) { self.checked = false}
//                        else { self.checked = true }
//
//                    }){
//                        if self.checked == true {
//                            Image(systemName: "heart.fill")
//                                .foregroundColor(Color.red)
//                                .padding(.all)
//                        } else {
//                            Image(systemName: "heart")
//                                .padding(.all)
//                        }
//
//                    }
//                }
//            }
