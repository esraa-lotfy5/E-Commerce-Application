//
//  ProfileOrders.swift
//  E-Commerce Application
//
//  Created by Esraa Lotfy  on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.


import SwiftUI
import QGrid

struct ProfileOrders: View {
    var body: some View {
        VStack{
            //  ------------ start of order title --------------------
            HStack{
                Spacer().frame(width: 24)
                Text("Orders")
                    .foregroundColor(.black)
                    .font(.headline)
                Spacer()
                Text("More..")
                    .foregroundColor(.black)
                    .onTapGesture {
                        print("Navigate to orders screen")
                }
                Spacer().frame(width: 24)
            }
            .padding(.bottom, 16)
            //  ------------ end of order title ----------------------
            //  ------------ start of order grid --------------------
            ProductRow(firstItem: dummyProducts[0], secondItem: dummyProducts[1])
        }
    }
}

struct ProfileOrders_Previews: PreviewProvider {
    static var previews: some View {
        ProfileOrders()
    }
}
