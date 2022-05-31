//
//  OrdersList.swift
//  E-Commerce Application
//
//  Created by Esraa Lotfy  on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct ProductRow: View {
    let firstItem : Product
    let secondItem : Product
    var viewWidth : CGFloat = CGFloat(0.0)
    @State private var fav : Bool = false // by default is un fav
    init(firstItem: Product, secondItem: Product){
        self.viewWidth = (UIScreen.main.bounds.size.width-50)/2
        self.firstItem = firstItem
        self.secondItem = secondItem
    }

    var body: some View {
        HStack{
        Spacer().frame(width: 16)
        VStack(alignment: .leading){
            Image(firstItem.image)
            .resizable()
                .frame(width: (UIScreen.main.bounds.size.width-50)/2, height: (UIScreen.main.bounds.size.height-50)/3)
                .cornerRadius(15)
            
            HStack{
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Text(firstItem.name)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                            .frame(width: self.viewWidth-60, alignment: .leading)
                    }
                    Text("$ \(firstItem.price)")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }.padding(.leading, 16)
            }
        }.cornerRadius(15)
        .frame(width: self.viewWidth)
            
        Spacer()
        
        VStack(alignment: .leading){
            Image(secondItem.image)
            .resizable()
                .frame(width: (UIScreen.main.bounds.size.width-50)/2, height: (UIScreen.main.bounds.size.height-50)/3)
                .cornerRadius(15)
            
            HStack{
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Text(secondItem.name)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                            .frame(width: self.viewWidth-60, alignment: .leading)
                    }
                    Text("$ \(secondItem.price)")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }.padding(.leading, 16)
            }
        }.cornerRadius(15)
        .frame(width: self.viewWidth)
        Spacer().frame(width: 16)
        }.padding(.bottom, 16)
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(firstItem: dummyProducts[0], secondItem: dummyProducts[1])
    }
}


//.padding(.bottom, 10)
