//
//  SearchBarIcon.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 6/2/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import SwiftUI

struct SearchBarIcon: View {
    
    @State private var searchWord : String = ""
    
    var body: some View {
        
        HStack{
            
            Spacer().frame(width: 24)
            VStack{
                
            TextField("Search", text: $searchWord)
                .font(.title)
                .frame(width: UIScreen.main.bounds.size.width-100, alignment: .center)

            Divider()
                .frame(width: UIScreen.main.bounds.size.width-100, height: 1)
                .background(Color.black)
                }
            Spacer().frame(width: 24.0)
            
        }.padding(.bottom, 16)

    }
}
