//
//  CategoryTabs.swift
//  E-Commerce Application
//
//  Created by Esraa Lotfy  on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct CategoryTabs: View {
    
    enum Category: String, CaseIterable, Identifiable {
        case Men ,Women ,Kids ,Sale
        var id: Self { self }
    }
//    @Binding var x : String
    @Binding var x : CategoryTabs.Category
    @State var categoryViewModel : CategoryViewModel
    @State  private var selectedCategory: Category = .Men
    
    var body: some View {
        HStack{
            Spacer().frame(width:24)
            VStack{
             Picker("Category", selection: $selectedCategory) {
                   ForEach(Category.allCases) { cat in
                       Text(cat.rawValue.capitalized)
                       //getSelectedSegment(category: selectedCategory)
                       
                   }
               }
            }.pickerStyle(SegmentedPickerStyle())
            
            
            Spacer().frame(width:24)
        }.padding(.bottom, 16)
    }
    
    func getSelectedSegment(category : CategoryTabs.Category){
        if(category == .Men){ self.x = .Men} else{
            if(category == .Women){self.x = .Women}else{
                if(category == .Kids){self.x = .Kids}else{
                    if(category == .Sale){self.x = .Sale}
                }
            }
        }
    }
}

//struct CategoryTabs_Previews: PreviewProvider {
//    @State var viewModel = CategoryViewModel()
//    static var previews: some View {
//        CategoryTabs( categoryViewModel: $viewModel)
////    categoryViewModel: CategoryViewModel()
//    }
//}
