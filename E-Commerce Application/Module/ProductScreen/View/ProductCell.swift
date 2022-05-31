//
//  ProductCell.swift
//  E-Commerce
//
//  Created by Esraa Lotfy  on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct ProductCell: View {
   let firstItem : ProductItem
    var gridStyle : Bool
    var viewWidth : CGFloat = CGFloat(0.0)
    @State private var fav : Bool = false // by default is un fav
    init(firstItem: ProductItem, gridStyle:Bool){
        if(gridStyle){
            self.viewWidth = (UIScreen.main.bounds.size.width-50)/2
        }else{
            self.viewWidth = UIScreen.main.bounds.size.width-25
        }
        self.firstItem = firstItem
        self.gridStyle = gridStyle
    }

    var body: some View {
        VStack(alignment: .leading){
            if(gridStyle){
                Image(firstItem.image)
                .resizable()
                    .frame(width: (UIScreen.main.bounds.size.width-50)/2, height: (UIScreen.main.bounds.size.height-50)/3)
                    .cornerRadius(15)
            }else{
                Image(firstItem.image)
                .resizable()
                    .frame(width: (UIScreen.main.bounds.size.width-25), height: (UIScreen.main.bounds.size.height-50)/2)
                    .cornerRadius(25)
            }
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
                VStack(alignment: .trailing){
                    Button(action: {
                        if(self.fav){
                            self.fav = false
                        }else{
                            self.fav = true
                        }
                        print(String("heart button tapped"))
                    })
                    {
                        HStack {
                            if(self.fav){
                                Image(systemName:"heart.fill")
                                        .foregroundColor(.black)
                                        .scaledToFit()
                                        .foregroundColor(.red)
                            }
                            else{
                                Image(systemName:"heart")
                                .foregroundColor(.black)
                                .scaledToFit()
                                .foregroundColor(.black)
                            }
                        }.frame(width: 25, height: 20)
                            .background(Color.white)
                    }
                }
            }
        }.cornerRadius(15)
        .frame(width: self.viewWidth)
        .padding(.bottom, 10)
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(firstItem: dummyProducts[1], gridStyle: true)
    }
}
