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
    var brandName : String?

    @ObservedObject var categoryViewModel : CategoryViewModel
    @State var alertMessage = ""
    @State var alert_Title = ""
    @State private var isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    @State private var showingAlert = false

    init(brandName : String){
        self.categoryViewModel = CategoryViewModel(brandName: brandName)
    }
  
    
    var body: some View {
        if categoryViewModel.NetworkState == true {
    
        VStack{
            CategoryNavigationBar(categoryViewModel: self.categoryViewModel, alertMessage:  $alertMessage, alert_Title: $alert_Title, showingAlert: $showingAlert
                )
            Spacer()
            
            //MARK: Tabs
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
       
            if(categoryViewModel.searchEnbled){
                QGrid((categoryViewModel.productsCopy), columns: 2,vPadding: 0, hPadding: 8) {
                    CategoryCell(product: $0)}
                
            }else{
                QGrid((categoryViewModel.products), columns: 2,vPadding: 0, hPadding: 8) {
                    CategoryCell(product: $0)}
            }
            
        }.navigationBarBackButtonHidden(true)
                .alert(isPresented: self.$showingAlert) {
                    Alert(
                        title: Text(alert_Title), // $alerttitle
                        message: Text(alertMessage)
                    )
                    
                }
        }else{
            NoNetworkView()

        }
        //.navigationBarTitle("category")
        

        
    }
}


struct CategoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        CategoryScreen(brandName: "")
    }
}
