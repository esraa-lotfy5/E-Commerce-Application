//
//  BrandView.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 6/1/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import SwiftUI
import QGrid
import Kingfisher

struct BrandsView: View {
    @ObservedObject  var viewModel = HomeViewModel()

  var body: some View {
      QGrid(viewModel.brandsArr, columns: 2) { GridCell(brands: $0)}
  }
}

struct GridCell: View {
    var brands : Brand
    @State private var isActive = false

    var body: some View {

        VStack(){
            KFImage(URL(string: brands.brandImage))
            .resizable()
            .frame(width: 170, height: 150)
            .scaledToFit()
            .cornerRadius(20)
            .padding([.horizontal, .top], 7)
          
            
           
            Text(brands.brandTitle).lineLimit(2)
            .font(.headline)
            .padding()
        }.border(Color.gray,width: 4)
            .cornerRadius(10)
            .onTapGesture {
                self.isActive.toggle() } // activate link on image tap
            .background(NavigationLink(destination:  // link in background
                                       CategoryScreen(brandName: brands.brandTitle), isActive: $isActive) { EmptyView() })
 
 
}
}

struct BrandView_Previews: PreviewProvider {
    static var previews: some View {
            BrandsView()
        
    }
}
