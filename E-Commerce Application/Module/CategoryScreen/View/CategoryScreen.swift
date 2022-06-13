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
    @State var selectedCat = ""
    // by deafult user untapp search button
    @State private var searchTapped = false
    // request parameters
//    var parameters : [String:String] = ["vendor":"","collection_id":"273053679755","product_type":""] // by default for men
    //  Category View Model
    @ObservedObject var categoryViewModel : CategoryViewModel = CategoryViewModel()
//ADIDAS,"collection_id":"273053712523","product_type":"SHOES"
    var body: some View {
        
        VStack{
            CategoryNavigationBar()
            Spacer()
            
            //MARK:- Tabs
            if #available(iOS 14.0, *) {
                CategoryTabs(selectedCategory: $categoryViewModel.selectedCategory)
                    .onChange(of: categoryViewModel.selectedCategory) { newValue in
                        categoryViewModel.param.updateValue(newValue.rawValue, forKey: "collection_id")
                        categoryViewModel.getProducts()
                        print("new value -> \(newValue)")
                    }
            } else {
                // Fallback on earlier versions
            }
            if #available(iOS 14.0, *) {
                SubCategoriesTabs(categoryViewModel: categoryViewModel)
                    .onChange(of: categoryViewModel.isProductTypeChanged) { newValue in
                        categoryViewModel.getProducts()
                    }
            } else {
                // Fallback on earlier versions
            }
            Spacer()
            
            QGrid((categoryViewModel.products), columns: 2,vPadding: 0, hPadding: 8) {
                CategoryCell(product: $0)
                
            }
            
            
        }.navigationBarBackButtonHidden(true)
            
        //.navigationBarTitle("category")
        

        
    }
}


struct CategoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        CategoryScreen()
    }
}
