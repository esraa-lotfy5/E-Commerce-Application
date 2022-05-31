//
//  emptyWishList.swift
//  TrySwiftUI
//
//  Created by NourAllah Ahmed on 5/30/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//

import SwiftUI

struct emptyWishList: View {
      var body: some View {
         VStack {
             HeaderWishListView(header: "Nothing in your Wishlist , Start your Shopping NOW!", cartNum: "0", image: "" )
             Image("empytshoppingcart")
                 .resizable()
                 .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
         }
     }
}

struct emptyWishList_Previews: PreviewProvider {
    static var previews: some View {
        emptyWishList()
    }
}

