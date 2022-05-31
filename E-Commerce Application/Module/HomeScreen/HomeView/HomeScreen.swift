//
//  HomeScreen.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import SwiftUI
import QGrid

struct BrandsView: View {

  var body: some View {
    QGrid(productsArr, columns: 2) { GridCell(product: $0)}
  }
}

struct GridCell: View {
    var product : Product
    
    var body: some View {

        VStack(){
            Image(product.vendor)
            .resizable()
            .frame(width: 170, height: 150)
            .scaledToFit()
            .cornerRadius(20)
            .padding([.horizontal, .top], 7)
            
            Text(product.vendor).lineLimit(2)
                .font(.headline)
            .padding()
        }.border(Color.gray,width: 4)
        .cornerRadius(10)

    }
 
}

