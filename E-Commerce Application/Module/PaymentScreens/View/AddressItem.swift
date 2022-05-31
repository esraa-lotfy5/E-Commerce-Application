//
//  AddressItem.swift
//  E-Commerce Application
//
//  Created by Aya Abdelraouf on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//


import SwiftUI

struct AddressItem: View {
    var address : Address
    var body: some View {
        
        
        
        ZStack{
            RoundedRectangle (cornerRadius: 25,style: .continuous)
                .shadow(radius: 10)
                .background(Color.white)
            VStack{
                Text(address.name)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Text(address.address)
                    .font(.title)
                    .foregroundColor(.gray)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        .frame(width: 350 , height: 250)
        
        
    }}

struct AddressItem_Previews: PreviewProvider {
    static var previews: some View {
        AddressItem(address:Address(id: 1, name: "aya", address: "ahooo", city: "maddya", zipCode: 112, state:
            "cairo", defultShippingAddress: false))
        
    }
}
