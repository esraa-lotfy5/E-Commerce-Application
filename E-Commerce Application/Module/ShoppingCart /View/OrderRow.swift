//
//  OrderRow.swift
//  E-Commerce
//
//  Created by NourAllah Ahmed on 5/29/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//

import SwiftUI

struct OrderRow: View {
    var product : Product2
    
    @Binding var productPrice : Double
    @State var checked = false
    
    var body: some View {
        HStack{
            //MARK: Image
            
            //First
            ProductImage(imageName: "G")
            VStack{
                //Second
                ProductRowDetails(product: product, productPrice: $productPrice )
                
            }//VSTACK
        }
        .background(Color.gray.opacity(0.26))
        .cornerRadius(15)
        
    //HSTACK
}
}

//MARK:- >>>>>>>> Product Image <<<<<<<<<<<<
struct ProductImage: View {
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
