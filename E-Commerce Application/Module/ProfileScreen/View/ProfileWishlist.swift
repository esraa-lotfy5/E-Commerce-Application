//
//  ProfileWishlist.swift
//  E-Commerce Application
//
//  Created by Esraa Lotfy  on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct ProfileWishlist: View {
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
                }
                Spacer().frame(width: 24)
            }
            .padding(.bottom, 16)
            //  ------------ end of wishlist title ----------------------
            //  ------------ start of wishlist list --------------------
            ProductRow(firstItem: dummyProducts[0], secondItem: dummyProducts[1])
            ProductRow(firstItem: dummyProducts[2], secondItem: dummyProducts[3])
            //  ------------ end of wishlist list ----------------------
        }
    }
}

struct ProfileWishlist_Previews: PreviewProvider {
    static var previews: some View {
        ProfileWishlist()
    }
}
