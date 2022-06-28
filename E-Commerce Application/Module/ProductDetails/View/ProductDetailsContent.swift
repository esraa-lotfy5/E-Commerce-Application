//
//  ProductDetailsContent.swift
//  E-Commerce Application
//
//  Created by Abdelrhman Ahmed on 31/05/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct ProductDetailsContent: View {
    
    var title: String
    var details: String
    var backgroundColor: Color
    
    var body: some View {
        
        HStack {
            Text(title)
            Spacer()
            Text(details)
        }.padding().background(backgroundColor)
        
    }
}

struct ProductDetailsContentWithOptions: View {
    
    var title: String
    var details: [String]
    var backgroundColor: Color
    @Binding var text: String
    @State var isSelected : Bool = false
    @State var color : Color = Color.black
    var body: some View {
      
        HStack {
            Text(title)
            Spacer()
            ScrollView (.horizontal,showsIndicators: false){
                HStack {
                    ForEach(details , id: \.self){ item  in
                        Button(action: {
                            _text.wrappedValue = item
                        }, label: {
                            Text(" \(item) ")
                                .scaledToFit()
                                .font(.system(size: 16))
                                .foregroundColor( _text.wrappedValue == item ? .black: .white)  // <-- Here
//                                .fontWeight(.semibold)
                                .padding(6)
                                .background(Color.blue)
                                .cornerRadius(5)
                        })
             

                    }
                }
            .frame(height: 50)
        }
        }.padding().background(backgroundColor)
        
    }
}


struct ProductDetailsContent_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsContent(
            title: "Sizes",
            details: "7.5, 8, 8.5, 9, 9.5, 10, 10.5",
            backgroundColor: Color(red: 232/255, green: 232/255, blue: 232/255)
        )
    }
}
