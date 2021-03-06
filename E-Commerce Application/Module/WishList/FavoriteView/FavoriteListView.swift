//
//  FavoriteListView.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 17/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI
import Kingfisher

struct FavoriteListView: View {
    @ObservedObject  var viewModelFavorite = WishListViewModel()
    @State private var isActive = false
    @ObservedObject  var viewModelDetails = ProductDetailsViewModel()
    @State var productFavId : Int?
    @State var favoriteArr : [DraftOrder]?
    // @ObservedObject  var viewModelFavorite = WishListViewModel()
    
    @State private var IsEgp : Bool?
    
    @State private var Egp = UserDefaults.standard.float(forKey: "EGP")
    @State private var usd = UserDefaults.standard.float(forKey: "USD")
    
    var body: some View {
        
        // NavigationView{
        List{
            if viewModelFavorite.wishList.isEmpty{
                NoFavoriteView()
            }
            else{
                
                ForEach(viewModelFavorite.wishList, id: \.self) { row in
                    
                    
                    if #available(iOS 15.0, *) {
                        Section{
                            
                            VStack{
                                Text("\(row.lineItems?[0].name ?? "")")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .lineLimit(1)
                                
                                HStack{
                                    // Image(systemName: "heart")
                                    KFImage(URL(string: row.noteAttributes?[0].value ?? ""))
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                    VStack{
                                        //                                       Text("Product: \(row.lineItems?[0].name ?? "")")
                                        //                                           .font(.subheadline)
                                        //                                           .fontWeight(.bold)
                                        //                                           .frame(maxWidth: .infinity, alignment: .leading)
                                        //                                           .padding()
                                        //                                           .lineLimit(1)
                                        Text("Vendor: \(row.lineItems?[0].vendor ?? "")")
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                            .padding()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        if IsEgp ?? true{
                                            Text("Price: \(row.lineItems?[0].price ?? "") EGP")
                                                .font(.subheadline)
                                                .fontWeight(.semibold)
                                                .padding()
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                        }else{
                                            Text("Price: \((Float(row.lineItems?[0].price ?? "") ?? 0.0) / Egp  , specifier: "%.2f") USD")
                                                .font(.subheadline)
                                                .fontWeight(.semibold)
                                                .padding()
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                        }
                                        
                                        
                                    }
                                }
                            }
                            //.background(frame(width: 400, height: 150))
                            //.background(Image("coupon").resizable().frame(width: 400, height: 250))
                            //.listRowSeparator(.hidden)
                            // .listRowInsets(EdgeInsets())
                            //.listRowBackground(Color.clear)
                            //.ignoresSafeArea(edges: .horizontal)
                            .background(Color.white)
                            .cornerRadius(10)
                            .deleteDisabled(false)
                            .padding()
                            //.padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                            
                            
                        }
                        .swipeActions{
                            
                            Button {
                                
                                print("Delete")
                                print("Row id == \(row.id)")
                                deleteItem(productId: row.id ?? 0)
                                
                            } label: {
                                
                                Label("Delete",systemImage: "trash.circle.fill")
                                
                                
                            }.tint(Color.red)
                            
                            
                        }
                        
                        
                        
                        
                        .onAppear(perform: {
                            //                               self.productFavId = row.id
                            //                               print("PRODUCT ID == \(productFavId)")
                            //  viewModelFavorite.getFavorites()
                            favoriteArr = viewModelFavorite.wishList
                            print("Array from on appear == \(favoriteArr)")
                            
                        })
                        .onTapGesture {
                            //                               print("onTap == \(String(describing: row.id))")
                            //                               self.isActive.toggle()
                            
                            
                            
                        }
                    } else {
                        // Fallback on earlier versions
                    }
                }
                
                
                
            }
        }    .onAppear{
            self.IsEgp = UserDefaults.standard.bool(forKey: "isEGP")
            
        }
        //  .onDelete(perform:self.delete)
        
        
        
        
        
        //                   .onAppear(perform: {
        //                       self.viewModelFavorite.getFavorites()
        //                   })
        
        
        
        
        //}
        .navigationBarBackButtonHidden(true)
        
        
    }
    
    private func delete(at offsets: IndexSet) {
        
        self.favoriteArr?.remove(atOffsets: offsets)
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    private func deleteItem (productId : Int ){
        for (index, element) in viewModelFavorite.wishList.enumerated() {
            if element.id == productId {
                viewModelFavorite.wishList.remove(at: index)
                print("DELETED FROM ARRAY")
                print("OFFSET == \(productId)")
                self.viewModelDetails.deleteFavorite(draftFavoriteID: productId)
                //self.viewModelFavorite.getFavorites()
                
            }
            
        }
        
        
        
        
    }
    
    
}









