//
//  FavoriteView.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 17/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject  var viewModelFavorite = WishListViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack{
            HStack{
                Spacer().frame(width:10)
                
                HStack{
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
                .onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
                    
                }
                .frame(width: 50, height: 40)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                
                Text("Favorites")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding()
            }
            
            FavoriteListView()
        }
            .navigationBarBackButtonHidden(true)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
