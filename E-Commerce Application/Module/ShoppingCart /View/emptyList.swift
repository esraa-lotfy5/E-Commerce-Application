//
//  emptyList.swift
//  E-Commerce
//
//  Created by NourAllah Ahmed on 5/28/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//

import SwiftUI


struct emptyOrderList: View {
    var body: some View {
        VStack {
            HeaderView(header: "No orders yet , Start your order NOW!", cartNum: "0", image: "" )
            Image("empytshoppingcart")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
        }
    }
}


struct emptyOrderList_Previews: PreviewProvider {
    static var previews: some View {
        emptyOrderList()
    }
}
