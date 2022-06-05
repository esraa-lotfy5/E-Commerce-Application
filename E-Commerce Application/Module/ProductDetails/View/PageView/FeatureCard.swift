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
//    var image: Image
    var image : KFImage
    
    var body: some View {
        image.resizable()
            .scaledToFit()
//            .frame( height: 250)
//            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
//
//struct FeatureCard_Previews: PreviewProvider {
//    static var previews: some View {
//        FeatureCard(image: Image("bag1"))
//
//    }
//}
