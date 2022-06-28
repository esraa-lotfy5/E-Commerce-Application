//
//  CategoryCell.swift
//  E-Commerce Application
//
//  Created by Esraa Lotfy  on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI
import Kingfisher

let categoryDummyProducts = [CategoryProduct(id: 12564, title: "", vendor: "", productType: "", publishedScope: "", status: "", tags: "", variants: [], images: [])]

struct CategoryCell: View {
    
    @State private var isActive = false

    let product : CategoryProduct
    var viewWidth : CGFloat = CGFloat(0.0)
    @State private var fav : Bool = false // by default is un fav
    
    //currency
//
//    @State var currency = UserDefaults.standard.string(forKey: "currencyString")
//    @State var currencyValue = UserDefaults.standard.float(forKey: "currencyValue")
    
    @State private var IsEgp : Bool?

    @State private var Egp = UserDefaults.standard.float(forKey: "EGP")
    @State private var usd = UserDefaults.standard.float(forKey: "USD")
    @State var currencyString = UserDefaults.standard.string(forKey: "options")
    
    
    init(product: CategoryProduct){
        self.viewWidth = (UIScreen.main.bounds.size.width-50)/2
        self.product = product
    }

    var body: some View {
        VStack(alignment: .leading){
            KFImage(URL (string: product.images[0].src))
            .resizable()
            .frame(width: (UIScreen.main.bounds.size.width-50)/2, height: (UIScreen.main.bounds.size.height)/3.6)
                .cornerRadius(15)
            HStack{
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Text(product.title.split(separator: "|")[1])
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                            .frame(width: self.viewWidth-60, alignment: .leading)
                    }
                    if IsEgp ?? true {
                        Text("\(Float(product.variants[0].price)! , specifier: "%.2f") EGP")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                    else{
                 
                        
                        Text("\(Float(product.variants[0].price)! / Egp , specifier: "%.2f") USD")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                    
                   
                    
                 
                }.padding(.leading, 16)
//                VStack(alignment: .trailing){
//                    Button(action: {
//                        if(self.fav){
//                            self.fav = false
//                        }else{
//                            self.fav = true
//                        }
//                        print(String("heart button tapped"))
//                    })
//                    {
//                        HStack {
//                            if(self.fav){
//                                Image(systemName:"heart.fill")
//                                        .scaledToFit()
//                                        .foregroundColor(.red)
//                            }
//                            else{
//                                Image(systemName:"heart")
//                                .foregroundColor(.black)
//                                .scaledToFit()
//                            }
//                        }.frame(width: 25, height: 20)
//                            .background(Color.white)
//                    }
//                }
            }
        }.cornerRadius(15)
        .frame(width: self.viewWidth)
        .padding(.bottom, 10)
        
        .onTapGesture { self.isActive.toggle() } // activate link on image tap
                   .background(NavigationLink(destination:  // link in background
                                              ProductDetails(productId: String(self.product.id)), isActive: $isActive) { EmptyView() })
                   .onAppear{
                       self.IsEgp = UserDefaults.standard.bool(forKey: "isEGP")
                   }
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell(product: categoryDummyProducts[0])
    }
}
