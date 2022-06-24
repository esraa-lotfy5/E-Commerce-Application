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
    @State private var isActive = false
    @State private var isActivef = false
    @State var searchWord : String = ""
    let categoryViewModel : CategoryViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @ObservedObject  var viewModelWishList = WishListViewModel()
    
    
    
    var body: some View {
        VStack{
            HStack {
           
               Spacer().frame(width: 24.0)
            // --------Start back button -------------
            
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
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
            // -------- End back button ---------
            //  --------- start of Search icon -----------------
               Button(action: {
//                    print(String("magnifyingglass button tapped"))
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
            
                if #available(iOS 15.0, *) {
                    HStack {
                        Image(systemName: "cart")
                            .foregroundColor(.black)
                    }
                    .onTapGesture {self.isActivef.toggle() }
                    
                    .background(NavigationLink(destination: OrderListView(), isActive: $isActivef) { EmptyView() })
                    
                    .padding(15)
                    .frame(width: 50, height: 40)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                } else {
                    // Fallback on earlier versions
                }
               
            //  --------- end of cart icon -----------------
            Spacer().frame(width:8)
            //  --------- start of fav icon -----------------
        
                HStack {
                    Image(systemName: "heart")
                    .foregroundColor(.black)
                }
                .onTapGesture {self.isActive.toggle() }
                    
            //    .background(NavigationLink(destination: WishList(product: [Product3(name: "test", price: 90.0, size: "S", desc: "desc")]), isActive: $isActive) { EmptyView() })
             //   .background(NavigationLink(destination: WishList(), isActive: $isActive) { EmptyView() })
                .background(NavigationLink(destination: FavoriteView(), isActive: $isActive) { EmptyView() })
                .padding(15)
                .frame(width: 50, height: 40)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                
            //  --------- end of fav icon -----------------
               Spacer().frame(width: 24.0)
            }.padding(.bottom, 16)
               .padding(.top, 16)
                HStack{
            if(self.searchTapped){
    //            // Search Struct
                if #available(iOS 14.0, *) {
                    CategorySearchBar(searchWord: $searchWord)
                        .onChange(of: searchWord) { word in
//                            print(searchWord.uppercased())
                            if(searchWord == ""){
//                                print("search word is empty")
                                categoryViewModel.searchEnbled = false
                            }else{
                                categoryViewModel.searchEnbled = true
                                for product in categoryViewModel.products {
                                    if(product.title.split(separator: "|")[1].contains(searchWord.uppercased())){
//                                        print("title: \(product.title)")
                                    }
                                }
                                categoryViewModel.productsCopy = categoryViewModel.products.filter {$0.title.contains(searchWord.uppercased()) }
                            }
                        }}
                }
            }
        
        }
    }
}
    
struct CategoryNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CategoryNavigationBar(categoryViewModel: CategoryViewModel(brandName: ""))
    }
}


