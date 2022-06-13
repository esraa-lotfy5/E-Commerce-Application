//
//  AlertViewHome.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 11/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct AlertViewHome: View {
    
   // var strArr : [String] = ["first","second"]
    @ObservedObject  var viewModel = HomeViewModel()
    @Binding var show : Bool
    
    
    var body: some View {
        VStack
        {
            Text ("Get Your Discount")
                .fontWeight(.bold)
                .font(.title)
                .foregroundColor(.black)
                .padding(.bottom,5)
                .padding(.top,12)
            
            
            ForEach(viewModel.priceArr, id: \.self) { item in
                Text(item.title)
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.orange)
                    .padding(.top,15)
                    .padding(.bottom,5)
                    .frame( alignment: .leading)

            }
            Spacer()
            Button("Close") {
              show.toggle()
            }
            .foregroundColor(.blue)
            .font(.body)
            .frame(width: UIScreen.main.bounds.width/2, height: 35)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
            .padding(.bottom,5)

        }   .frame(width: UIScreen.main.bounds.width-50, height:300 , alignment: .center)
            .cornerRadius(12)
            .clipped()
            .padding(.bottom, 300)
            .padding(.top,90)
            .background(Image("coupon").resizable().frame(width: UIScreen.main.bounds.width-50, height: 300, alignment: .center).cornerRadius(20).padding(.bottom,300).padding(.top,90))
        
        
    }

    
}

