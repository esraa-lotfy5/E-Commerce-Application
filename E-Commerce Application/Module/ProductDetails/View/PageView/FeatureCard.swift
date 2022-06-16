//
//  FeatureCard.swift
//  E-Commerce Application
//
//  Created by Abdelrhman Ahmed on 31/05/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI
import Kingfisher

struct FeatureCard: View {
    var image: String

    var body: some View {
//        KFImage(URL (string: image))
//        .resizable()
        
        KFImage(URL(string:   image))
            .placeholder { Image("default") }
            .resizable()
            .onSuccess { r in print("done") }
            .onFailure { r in print("failure") }
            .loadImmediately()
//        image.resizable()
//            .scaledToFit()
//            .aspectRatio(3 / 2, contentMode: .fit)
    }
}

