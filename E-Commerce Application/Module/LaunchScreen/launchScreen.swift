//
//  launchScreen.swift
//  E-Commerce Application
//
//  Created by NourAllah Ahmed on 11/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import SwiftUI
import Kingfisher

struct SplachScreenView: View{
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State private var degree = 90.0
    @State private var movement = -155

    @State private var Xmovement = -250
    @State private var XXmovement = -250
    @State private var XXXmovement = -250

    //    @State private var toPoint = CGPoint(x: 0.0, y: 1.0)
//    @State private var fromPoint = CGPoint(x: 0.0, y: 0.0)
    var body : some View {
        if isActive{
            LoginScreen()
//            HomeScreen()
        }
        else{
        VStack{
            VStack{
                Image(systemName: "cube.box.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.blue)
                    .onAppear{
                        withAnimation(.easeIn(duration:0.8)){
      
                            self.XXXmovement += 430

                        }
                    }
                    .offset(x: -15, y: CGFloat(XXXmovement))
                
                Image(systemName: "cube.box.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.red)
                    .onAppear{
                        withAnimation(.easeIn(duration:0.8)){
      
                            self.XXmovement += 370

                        }
                    }
                    .offset(x: 20 , y: CGFloat(XXmovement))
                
                Image(systemName: "cube.box.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.black)
                    .onAppear{
                        withAnimation(.easeIn(duration:0.8)){
      
                            self.Xmovement += 330

                        }
                    }
                    .offset(x: 10 , y: CGFloat(Xmovement))
                Image(systemName: "cart")
                    .font(.system(size: 100))
                    .foregroundColor(.blue)
                    .onAppear{
                        withAnimation(.easeIn(duration:0.8)){
//                            self.size
//                            = 0.9
//                            self.opacity = 1.0
//                            self.degree = 1
                            self.movement += 150

                        }
                        
                      
                    }
                    .offset(x: CGFloat(movement), y: 10)
                    
//                    .rotationEffect(.degrees(degree))
                
              
                Text("Shoppingoo")
                    .font(Font.custom("Baskerville-Bold", size: 26))
                    .foregroundColor(.black.opacity(0.80))
                
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear{
                withAnimation(.easeIn(duration:0.2)){
                    self.size
                    = 1.9
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
