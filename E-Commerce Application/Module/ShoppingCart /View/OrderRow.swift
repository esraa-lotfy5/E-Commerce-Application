//
//  OrderRow.swift
//  E-Commerce
//
//  Created by NourAllah Ahmed on 5/29/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//

import SwiftUI
import Kingfisher
struct OrderRow: View {
    var product : DraftOrder
    
    @Binding var productPrice : Double
    @State var checked = false
    
    var body: some View {
        HStack{
            //MARK: Image
            
            //First
            ProductImage3(imageName: product.noteAttributes?.first?.value ?? "default")
            VStack{
                //Second
                ProductRowDetails(product: product, productPrice: $productPrice )
                
            }//VSTACK
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
        
    //HSTACK
}
}

//MARK:- >>>>>>>> Product Image <<<<<<<<<<<<
struct ProductImage3: View {
    var imageName :String
    var body: some View {
        
        KFImage.url(URL(string:   imageName))
            .placeholder { Image("default") }
            .resizable()
            .onSuccess { r in print("done") }
            .onFailure { r in print("failure") }
            .loadImmediately()
            .cornerRadius(15)
            .frame(width: 100, height: 150)
                    .padding()
            
    }
}
/*
 //Third
                HStack {
                    Spacer()
                    Button(action: {
                        if(self.checked == true) { self.checked = false}
                        else { self.checked = true }

                    }){
                        HStack{
                            if checked == true {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(Color.red)
                                    .padding(.all)
                            } else {
                                Image(systemName: "heart")
                                    .padding(.all)
                            }
                            
                        }
                        
                    }
                }//HSTACK
 */
