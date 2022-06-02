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
        
        VStack{
            
            
            CategoryNavigationBar()
            Spacer()
            
            //MARK:- Tabs
            CategoryTabs()
            Spacer()
            
            QGrid(dummyProducts, columns: 2, hPadding: 15) {
                CategoryCell(firstItem: $0)
                
                
                
            }
            
        }
        
    }
}


struct CategoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        CategoryScreen()
    }
}
