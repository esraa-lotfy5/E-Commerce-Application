//
//  BannerView.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct BannerView : View {
    let images = salesArr
    @State var activeImageIndex = 0

    let imageSwitchTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()

    var body : some View{
        VStack{
            Image(salesArr[activeImageIndex].image)
            .resizable()
            .frame(width: 400, height: 200)
            .cornerRadius(20)
            .padding()
                .onReceive(imageSwitchTimer) { _ in
                self.activeImageIndex = (self.activeImageIndex + 1) % self.images.count
            }

        }
    }

    
}

