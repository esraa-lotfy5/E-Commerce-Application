//
//  OrdersList.swift
//  E-Commerce Application
//
//  Created by Esraa Lotfy  on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//
import SwiftUI
import Kingfisher

struct  Product4 {
    var image :String
    var name :String
}
struct ProductRow: View {
    @ObservedObject  var viewModelFavorite = WishListViewModel()
    @State private var IsEgp : Bool?

    @State private var Egp = UserDefaults.standard.float(forKey: "EGP")
    @State private var usd = UserDefaults.standard.float(forKey: "USD")


    let firstItem : DraftOrder
    let secondItem : DraftOrder
    var viewWidth : CGFloat = CGFloat(0.0)
    @State private var fav : Bool = false // by default is un fav
    init(firstItem: DraftOrder, secondItem: DraftOrder){
        self.viewWidth = (UIScreen.main.bounds.size.width-50)/2
        self.firstItem = firstItem
        self.secondItem = secondItem
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
                    
                    
                    if IsEgp ?? true {
                        
                        Text(" \(firstItem.totalPrice )  EGP ").foregroundColor(.blue)
                       
                    }
                    else{
                        Text(" \((Float(firstItem.totalPrice ) ?? 0.0) / Egp , specifier: "%.2f")  USD ").foregroundColor(.blue)
                        
                        
                    }
                   
                }.padding(.leading, 16)
            }
        }.cornerRadius(15)
        .frame(width: self.viewWidth)
            
        Spacer()
        
        VStack(alignment: .leading){
            KFImage(URL(string:secondItem.noteAttributes?[0].value ?? ""))
            .resizable()
                .frame(width: (UIScreen.main.bounds.size.width-50)/2, height: (UIScreen.main.bounds.size.height-50)/3)
                .cornerRadius(15)
            
            HStack{
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Text(secondItem.lineItems?[0].name ?? "N/A")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                            .frame(width: self.viewWidth-60, alignment: .leading)
                    }
                    
                    if IsEgp ?? true {
                        
                        Text(" \(secondItem.totalPrice )  EGP ").font(.subheadline)
                            .foregroundColor(.blue)
                       
                    }
                    else{
                        Text(" \((Float(secondItem.totalPrice ) ?? 0.0) / Egp , specifier: "%.2f")  USD ").font(.subheadline)
                            .foregroundColor(.blue)
                        
                        
                    }
                        
                }.padding(.leading, 16)
            }
        }.cornerRadius(15)
        .frame(width: self.viewWidth)
        Spacer().frame(width: 16)
        }.padding(.bottom, 16)
            .onAppear{
                self.IsEgp = UserDefaults.standard.bool(forKey: "isEGP")

            }
    }
}

//struct ProductRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductRow(firstItem: viewModelFavorite.wishList[0], secondItem: viewModelFavorite.wishList[1])
//    }
//}

//.padding(.bottom, 10)
