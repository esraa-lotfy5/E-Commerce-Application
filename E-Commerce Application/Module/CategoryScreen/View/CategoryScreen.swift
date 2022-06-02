//
//  CategoryScreen.swift
//  E-Commerce Application
//
//  Created by Esraa Lotfy  on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI
import QGrid


struct CategoryScreen: View {
    // by deafult user untapp search button
    @State private var searchTapped = false

    var body: some View {
        
//        NavigationView {
            
            VStack{
                
                VStack {
                    
                    //MARK:  ------------------ > nav bars <------------------
                    HStack{
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
                        //MARK:  ------------ end of search icon --------------------
                        Spacer()
                        //MARK: ------------- start of header text --------------------------
                        Text("Categories")
                            .fontWeight(.bold)
                        //MARK: ------------ end of header text --------------------
                        Spacer()
                        //MARK: --------- start of cart icon -----------------
                        NavigationLink(destination:OrderListView(product: [Product2( name: "test", price: 89.0, size: "S", desc: "desc")])){
                            Image(systemName: "cart")
                                .foregroundColor(.black)
                        }
                        .padding(15)
                        .frame(width: 50, height: 40)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                        
                        //  --------- end of cart icon -----------------
                        Spacer().frame(width:8)
                        //  --------- start of fav icon -----------------
                        NavigationLink(destination:WishList(product: [Product3(name: "test", price: 90.0, size: "S", desc: "desc")])){

                                Image(systemName: "heart")
                                    .foregroundColor(.black)
                            }
                            .padding(15)
                            .frame(width: 50, height: 40)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                        
                        //  --------- end of fav icon -----------------
                        Spacer().frame(width: 24.0)
                    }.padding(.bottom, 16)
                        .padding(.top, .some(0.0))
                    HStack{
                        if(self.searchTapped){
                            //            // Search Struct
                            CategorySearchBar()
                        }
                    }

                }.padding(.bottom , .some(0.20))
                
                Spacer()
                
                //MARK:- Tabs
                CategoryTabs()
                Spacer()
                NavigationLink(destination: ProductDetails(product: Product())){

                QGrid(dummyProducts, columns: 2, hPadding: 15) {
                            CategoryCell(firstItem: $0)
                        
                    }
                }
                
            }
//            .navigationBarHidden(true)
        
//        }
    }
    }


struct CategoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        CategoryScreen()
    }
}
