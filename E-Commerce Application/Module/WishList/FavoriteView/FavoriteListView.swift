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

    @State var currencyFav = UserDefaults.standard.string(forKey: "currencyString")
    @State var currencyValueFav = UserDefaults.standard.float(forKey: "currencyValue")
    
    var body: some View {
        
       // NavigationView{
                   List{
                   
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
                                               
                                             //  Text("\(currency ?? " ") \((Double(product.variants[0].price) ?? 0.0) / Double(currencyValue ?? 1.0) , specifier: "%.2f")")
                                               
                                               //Text("Price: \((row.lineItems?[0].price ?? "")/ Double(currencyValueFav ?? 1.0) , specifier: "%.2f") \(currencyFav ?? "")")
                                               Text("Price: \((Double(row.lineItems?[0].price ?? "") ?? 0.0) / Double(currencyValueFav ) , specifier: "%.2f") \(currencyFav ?? "")")
                                               
                                                   .font(.subheadline)
                                                   .fontWeight(.semibold)
                                                   .padding()
                                                   .frame(maxWidth: .infinity, alignment: .leading)
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
                                      // isActive.toggle()
                                       
                                   } label: {
                                       
                                       Label("Delete",systemImage: "trash.circle.fill")
                                           
                                       
                                   }

                                    .tint(Color.red)
                                   
                                   
                               }
//                               .alert(isPresented: $isActive) { () -> Alert in
//                                   Alert(title: Text("Alert"), message: Text("Do you want to delete this item ?"), primaryButton: .default(Text("Delete"), action: {
//                                       print("Okay Click")
//                                       print("Delete")
//                                       print("Row id == \(row.id)")
//                                       deleteItem(productId: row.id ?? 0)
//
//                                   }), secondaryButton: .destructive(Text("Cancel")))
//                               }
                               
                               
                               
                               .onAppear(perform: {
                                   //                               self.productFavId = row.id
                                   //                               print("PRODUCT ID == \(productFavId)")
                                   //  viewModelFavorite.getFavorites()
                                   //favoriteArr = viewModelFavorite.wishList
                                   //print("Array from on appear == \(favoriteArr)")
                                  // self.viewModelFavorite.getFavorites()
                               })
                               .onTapGesture {
                                   //                               print("onTap == \(String(describing: row.id))")
                                   //                               self.isActive.toggle()
                                   
                                   
                                   
                               }
                           } else {
                               // Fallback on earlier versions
                           }
                           }
                       //.onDelete(perform:self.delete)

                           
                           
                           //                           NavigationLink(destination: ProductDetails(),isActive: $isActive) {
                           //
                           //                              EmptyView()
                           //                          }
//                           .background(NavigationLink(destination:  // link in background
//                                                      ProductDetails(productId: String(productFavId ?? 0)), isActive: $isActive) { EmptyView() })
                           
                           
                           
                           
                       }
                       
                       
                       
                       
                       
                   
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
           // self.viewModelFavorite.getFavorites()
    }
    
    
    
    
}


}









