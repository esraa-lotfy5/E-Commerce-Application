//
//  CategoryCell.swift
//  E-Commerce Application
//
//  Created by Esraa Lotfy  on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct CategoryCell: View {
    
    @State private var isActive = false

    let firstItem : ProductItem
    var viewWidth : CGFloat = CGFloat(0.0)
    @State private var fav : Bool = false // by default is un fav
    init(firstItem: ProductItem){
        self.viewWidth = (UIScreen.main.bounds.size.width-50)/2
        self.firstItem = firstItem
    }

    var body: some View {
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
//                                        .foregroundColor(.black)
                                        .scaledToFit()
                                        .foregroundColor(.red)
                            }
                            else{
                                Image(systemName:"heart")
                                .foregroundColor(.black)
                                .scaledToFit()
//                                .foregroundColor(.black)
                            }
                        }.frame(width: 25, height: 20)
                            .background(Color.white)
                    }
                }
            }
        }.cornerRadius(15)
        .frame(width: self.viewWidth)
        .padding(.bottom, 10)
        
        .onTapGesture { self.isActive.toggle() } // activate link on image tap
                   .background(NavigationLink(destination:  // link in background
                   ProductDetails(), isActive: $isActive) { EmptyView() })
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell(firstItem: dummyProducts[0])
    }
}
