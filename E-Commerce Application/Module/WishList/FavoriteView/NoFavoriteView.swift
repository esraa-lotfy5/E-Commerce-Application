//
//  NoFavoriteView.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 24/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct NoFavoriteView: View {
    var body: some View {
        VStack{
            Image("NoFavorite")
                .resizable()
                .frame(width: 300, height: 200, alignment: .center)
                .cornerRadius(20)
            
            Text("No Favorite Item Yet !")
                .foregroundColor(Color.red)
                .font(.title)
                .padding()
            
        }.navigationBarBackButtonHidden(true)
        
    }
}

struct NoFavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        NoFavoriteView()
    }
}
