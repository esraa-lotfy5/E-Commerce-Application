//
//  BannerView.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 6/1/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import SwiftUI

struct BannerViewSettings : View {
    @State private var searchTapped = false
    var body: some View {
        VStack{
            HStack {
           
               Spacer().frame(width: 24.0)
            //  --------- start of Search icon -----------------
               Button(action: {
                    print(String("magnifyingglass button tapped"))
                if(self.searchTapped){
                    self.searchTapped = false
                }else{
                    self.searchTapped = true
                }
               })
               {
                   HStack {
                       Image(systemName: "chevron.left")
                           .foregroundColor(.black)
                   }
                   .padding(15)
                   .frame(width: 50, height: 40)
                   .background(Color.white)
                   .cornerRadius(10)
                   .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
               }
            //  ------------ end of search icon --------------------
               Spacer()
            //  ------------- start of header text --------------------------
               Text("Settings")
                   .fontWeight(.bold)
                .font(.title)
            //  ------------ end of header text --------------------
               Spacer()
                Spacer()

        }.padding(.bottom, 16)
           .padding(.top, 16)
            HStack{
        if(self.searchTapped){

        }
            }
        }
    }
}
