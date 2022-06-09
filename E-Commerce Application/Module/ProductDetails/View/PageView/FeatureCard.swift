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
    var image: KFImage

    var body: some View {
        image.resizable()
            .scaledToFit()
//            .aspectRatio(3 / 2, contentMode: .fit)
    }
}

