//
//  CategoryNavigationBar.swift
//  E-Commerce Application
//
//  Created by Esraa Lotfy  on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct CategoryNavigationBar: View {
    
    // by deafult user untapp search button
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
                       Image("magnifyingglass")
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
               Text("Categories")
                   .fontWeight(.bold)
            //  ------------ end of header text --------------------
               Spacer()
            //  --------- start of cart icon -----------------
               Button(action: {
                   print(String("cart button tapped"))
               })
               {
                   HStack {
                       Image(systemName: "cart")
                       .foregroundColor(.black)
                   }
                   .padding(15)
                   .frame(width: 50, height: 40)
                   .background(Color.white)
                   .cornerRadius(10)
                   .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
               }
            //  --------- end of cart icon -----------------
            Spacer().frame(width:8)
            //  --------- start of fav icon -----------------
            Button(action: {
                print(String("fav button tapped"))
            })
            {
                HStack {
                    Image(systemName: "heart")
                    .foregroundColor(.black)
                }
                .padding(15)
                .frame(width: 50, height: 40)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                }
            //  --------- end of fav icon -----------------
               Spacer().frame(width: 24.0)
            }.padding(.bottom, 16)
               .padding(.top, 16)
                HStack{
            if(self.searchTapped){
    //            // Search Struct
                CategorySearchBar()
            }
        }
        }
    }
}

struct CategoryNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CategoryNavigationBar()
    }
}