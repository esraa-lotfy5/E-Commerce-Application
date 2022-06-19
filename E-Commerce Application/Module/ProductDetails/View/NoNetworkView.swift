//
//  NoNetworkView.swift
//  E-Commerce Application
//
//  Created by NourAllah Ahmed on 19/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import SwiftUI
import Kingfisher

struct NoNetworkView: View {
    var body: some View {
        VStack {
//            Image("empytshoppingcart")
            KFImage(URL(string: "https://i.pinimg.com/564x/8e/0f/14/8e0f14accd8523a1ea5c8a8b6339a005.jpg"))
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}
