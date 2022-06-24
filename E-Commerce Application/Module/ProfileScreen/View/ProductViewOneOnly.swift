//
//  ProductViewOneOnly.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 24/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI
import Kingfisher

struct ProductViewOneOnly: View {

        @ObservedObject  var viewModelFavorite = WishListViewModel()



        let firstItem : DraftOrder
        //let secondItem : DraftOrder
        var viewWidth : CGFloat = CGFloat(0.0)
        @State private var fav : Bool = false // by default is un fav
        init(firstItem: DraftOrder){
            self.viewWidth = (UIScreen.main.bounds.size.width-50)/2
            self.firstItem = firstItem
            //self.secondItem = secondItem
        }
        var body: some View {
            HStack{
            Spacer().frame(width: 16)
            VStack(alignment: .leading){
                Image(firstItem.name ?? "N/A")
                .resizable()
                    .frame(width: (UIScreen.main.bounds.size.width-50)/2, height: (UIScreen.main.bounds.size.height-50)/3)
                    .cornerRadius(15)
                
                HStack{
                    VStack(alignment: .leading){
                        VStack(alignment: .leading){
                            Text(firstItem.lineItems?[0].name ?? "N/A")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.leading)
                                .frame(width: self.viewWidth-60, alignment: .leading)
                        }
                        Text("$ \(firstItem.totalPrice)")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }.padding(.leading, 16)
                }
            }.cornerRadius(15)
            .frame(width: self.viewWidth)
                
            Spacer()
            
            }
        }
    }

