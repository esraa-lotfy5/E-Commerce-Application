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
    //@State var favoriteList : [DraftOrder]?
   // @ObservedObject  var viewModelFavorite = WishListViewModel()

    
    var body: some View {
        
       // NavigationView{
                   List{
                   
                       ForEach(viewModelFavorite.wishList, id: \.self) { row in
        
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
                                       Text("Price: \(row.lineItems?[0].price ?? "")")
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
                           .onAppear(perform: {
//                               self.productFavId = row.id
//                               print("PRODUCT ID == \(productFavId)")
                             //  viewModelFavorite.getFavorites()
                           })
                           .onTapGesture {
                               print("onTap == \(String(describing: row.id))")
                               self.isActive.toggle()
                               
                               

                           }.alert(isPresented: $isActive) { () -> Alert in
                                   Alert(title: Text("Alert"), message: Text("Do you want to delete this item ?"), primaryButton: .default(Text("Delete"), action: {
                                       print("Okay Click")
                                       deleteItem(productId: row.id ?? 0)
                                      // viewModelFavorite.getFavorites()
                           
                                   }), secondaryButton: .destructive(Text("Cancel")))
                           }
                           
                           
                           //                           NavigationLink(destination: ProductDetails(),isActive: $isActive) {
                           //
                           //                              EmptyView()
                           //                          }
//                           .background(NavigationLink(destination:  // link in background
//                                                      ProductDetails(productId: String(productFavId ?? 0)), isActive: $isActive) { EmptyView() })
                           
                           
                           
                           
                       }
                       
                       //.onDelete(perform: self.delete)
                       
                       
                   }
//                   .onAppear(perform: {
//                       self.viewModelFavorite.getFavorites()
//                   })
                   
        
        
        
        //}
                   .navigationBarBackButtonHidden(true)
        
        
    }
    
    private func delete(at offsets: IndexSet) {
        
        self.viewModelFavorite.wishList.remove(atOffsets: offsets)
        
        
        print("OFFSET == \(productFavId)")
        self.viewModelDetails.deleteFavorite(draftFavoriteID: self.productFavId ?? 0)
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    private func deleteItem (productId : Int){
        for (index, element) in viewModelFavorite.wishList.enumerated() {
            if element.id == productId {
                viewModelFavorite.wishList.remove(at: index)
                print("DELETED FROM ARRAY")
                print("OFFSET == \(productId)")
                self.viewModelDetails.deleteFavorite(draftFavoriteID: productId)
                self.viewModelFavorite.getFavorites()
            
        }
  
    }
    
    
    
    
}


}









