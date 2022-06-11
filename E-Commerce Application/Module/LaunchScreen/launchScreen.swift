//
//  launchScreen.swift
//  E-Commerce Application
//
//  Created by NourAllah Ahmed on 11/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import SwiftUI

struct SplachScreenView: View{
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body : some View {
        if isActive{
            LoginScreen()
        }
        else{
        VStack{
            VStack{
                Image(systemName: "cart")
                    .font(.system(size: 150))
                    .foregroundColor(.blue)
                Text("Shoppingoo")
                    .font(Font.custom("Baskerville-Bold", size: 26))
                    .foregroundColor(.black.opacity(0.80))
                
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear{
                withAnimation(.easeIn(duration:1.2)){
                    self.size
                    = 0.9
                    self.opacity = 1.0
                }
            }
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0 ){
                self.isActive = true
            }
        }
        }
    }
}

struct SplachScreenView_Preview : PreviewProvider{
    static var previews: some View{
        SplachScreenView()
    }
}
