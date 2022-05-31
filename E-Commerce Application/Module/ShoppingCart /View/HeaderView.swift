//
//  HeaderView.swift
// E-Commerce
//
//  Created by NourAllah Ahmed on 5/27/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//

import SwiftUI
import QGrid
import Alamofire
struct HeaderView: View {
    var header : String
    @State var cartNum : String
    var image :String
    var body: some View {
        HStack{
        Text(header)
            .padding()
            .foregroundColor(.blue)
            .font(.title)
//        Spacer()
//            Text(String(cartNum))
//                .foregroundColor(.red)
//                .font(.headline)
//            Image(systemName: image )
//                .foregroundColor(.red)
//                .padding(.trailing)
//                .padding(.top)
//                .padding(.bottom)
        }
    }
}
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(header: "Your Orders", cartNum: "", image: "cart")
    }
}
