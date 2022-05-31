//
//  ProductDetailsImage.swift
//  E-Commerce Application
//
//  Created by Abdelrhman Ahmed on 31/05/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct ProductDetailsImage: View {

//    var image: [ProductImage]
    var image: Image
    
    var body: some View {
        
        
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(0..<10) {_ in
//                    Text("Item \($0)")
//                        .foregroundColor(.white)
//                        .font(.largeTitle)
//                        .frame(width: 200, height: 200)
//                        .background(Color.red)
                    
//                    image.resizable()
//                        .scaledToFit()
//                        .frame(height: 250)
                    
                    self.image.resizable()
                        .frame(maxWidth: .infinity, maxHeight: 250)
                        
                    
                }
            }
        }
        
//        TabView {
//            Text("First View")
//                .padding()
//                .tabItem {
////                    Label("First", systemImage: "1.circle")
//                    Text("First")
//                }
//                .tag(1)
//
//            Text("Second View")
//                .padding()
//                .tabItem {
////                    Label("Second", systemImage: "2.circle")
//                    Text("Second")
//                }
//                .tag(2)
//        }
        
        
//        TabView {
//            Text("First")
//            Text("Second")
//            Text("Third")
//            Text("Fourth")
//        }
//        .tabViewStyle(PageTabViewStyle())
        
        
//        TabView {
//                    Text("First")
//                    Text("Second")
//                    Text("Third")
//                    Text("Fourth")
//                }
//                .tabViewStyle(PageIndexViewStyle())
//                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        
//        image.resizable()
//            .scaledToFit()
//            .frame(height: 250)
        
    }
}

struct ProductDetailsImage_Previews: PreviewProvider {
    static var previews: some View {
        
//        let images = [ProductImage(product_id: 1, id: 1, position: 1, created_at: <#T##String?#>, updated_at: <#T##String?#>, width: <#T##Int?#>, height: <#T##Int?#>, src: <#T##String?#>, admin_graphql_api_id: <#T##String?#>)]
        
        ProductDetailsImage(image: Image("bag1"))
    }
}
