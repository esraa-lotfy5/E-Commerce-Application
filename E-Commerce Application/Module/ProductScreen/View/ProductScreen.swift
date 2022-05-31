//
//  ProductScreen.swift
//  E-Commerce
//
//  Created by Esraa Lotfy  on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//
let dummyProducts = [
    ProductItem(image: "1", name: "Tommy Jeans", Description: "Heart pribt top", price: "69.50"),
    ProductItem(image: "2", name: "Oodji", Description: "Deep Green dress", price: "10.99"),
    ProductItem(image: "3", name: "profit", Description: "Light  Beige Suit", price: "103.99"),
    ProductItem(image: "1", name: "Benetton", Description: "Button Down Shirt", price: "45.00"),
    ProductItem(image: "2", name: "Tommy Jeans", Description: "Heart pribt top", price: "69.50"),
    ProductItem(image: "3", name: "Oodji", Description: "Deep Green dress", price: "10.99"),
    ProductItem(image: "1", name: "profit", Description: "Light  Beige Suit", price: "103.99"),
    ProductItem(image: "2", name: "Benetton", Description: "Button Down Shirt", price: "45.00"),
]

import SwiftUI
import QGrid

struct ProductScreen: View {
    
    //  By deafult view style is grid
   @State private var gridStyle = true
    
    var body: some View {
        VStack{
            HStack {

                Spacer().frame(width: 24.0)
                Button(action: { print(String("back button tapped"))})
                {
                    HStack {
                        Image("chevron.backward")
                            .foregroundColor(.black)
                    }
                    .padding(15)
                    .frame(width: 50, height: 40)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                }
                Spacer()
                Text("Products")
                    .fontWeight(.bold)
                Spacer()
                Button(action: {
                    if(self.gridStyle){
                        print(String("list style button tapped"))
                        self.gridStyle = false
                    }else{
                        print(String("grid style button tapped"))
                        self.gridStyle = true
                    }
                })
                {
                    HStack {
                        if(self.gridStyle){
                            Image(systemName: "list.bullet")
                            .foregroundColor(.black)
                        }else{
                            Image(systemName: "square.grid.2x2")
                            .foregroundColor(.black)
                        }

                    }
                    .padding(15)
                    .frame(width: 50, height: 40)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                }
                Spacer().frame(width: 24.0)
            }.padding(.bottom, 16)
                .padding(.top, 16)

            if(self.gridStyle){
                QGrid(dummyProducts, columns: 2, hSpacing: 16, hPadding: 16) {
                    ProductCell(firstItem: $0, gridStyle: true) }
            }else{
                QGrid(dummyProducts, columns: 1, hSpacing: 24, hPadding: 16) { ProductCell(firstItem: $0, gridStyle: false) }
            }
        }
    }
}

struct ProductScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductScreen()
    }
}
