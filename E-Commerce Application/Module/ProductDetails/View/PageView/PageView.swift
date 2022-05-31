//
//  PageView.swift
//  E-Commerce Application
//
//  Created by Abdelrhman Ahmed on 31/05/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    var pages: [Page]
    @State private var currentPage = 0

    var body: some View {
//        PageViewController(pages: pages, currentPage: $currentPage)
        
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
        
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        
//        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
//            .aspectRatio(3 / 2, contentMode: .fit)
        
        PageView(pages: [FeatureCard(image: Image("bag1")), FeatureCard(image: Image("bag2")), FeatureCard(image: Image("bag3")), FeatureCard(image: Image("bag4"))])
//            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
