//
//  ProfileWishlist.swift
//  E-Commerce Application
//
//  Created by Esraa Lotfy  on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct ProfileWishlist: View {
    @ObservedObject  var viewModelFavorite = WishListViewModel()
    @State private var isActive = false
    var body: some View {
        VStack{
            //  ------------ start of wishlist title --------------------
            HStack{
                Spacer().frame(width: 24)
                Text("Wishlist")
                    .foregroundColor(.black)
                    .font(.headline)
                Spacer()
                Text("More..")
                    .foregroundColor(.black)
                    .onTapGesture {
                        print("Navigate to wishlist screen")
                        isActive.toggle()
                }.background(NavigationLink(destination:  // link in background
               FavoriteView(), isActive: $isActive) { EmptyView() })
                Spacer().frame(width: 24)
            }
            .padding(.bottom, 16)
            //  ------------ end of wishlist title ----------------------
            //  ------------ start of wishlist list --------------------
            if viewModelFavorite.wishList.count >  0 {
                ProductViewOneOnly(firstItem: viewModelFavorite.wishList[0])
            }
            if viewModelFavorite.wishList.count >  1 {
                ProductRow(firstItem: viewModelFavorite.wishList[0], secondItem: viewModelFavorite.wishList[1])
                
            }
            if viewModelFavorite.wishList.count <=  0 {
                
                NoFavoriteView()
            }
            
            //ProductRow(firstItem: dummyProducts[2], secondItem: dummyProducts[3])
            //  ------------ end of wishlist list ----------------------
        }
    }
}

struct ProfileWishlist_Previews: PreviewProvider {
    static var previews: some View {
        ProfileWishlist()
    }
}
