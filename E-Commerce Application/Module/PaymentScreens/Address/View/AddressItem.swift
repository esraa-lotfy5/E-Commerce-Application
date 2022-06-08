//
//  AddressItem.swift
//  E-Commerce Application
//
//  Created by Aya Abdelraouf on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//


import SwiftUI

struct AddressItem: View {
    var address : Addresss
    var body: some View {
        
        
        
        ZStack{
            
            RoundedRectangle (cornerRadius: 25,style: .continuous)
                .shadow(radius: 10)
                .foregroundColor(Color.white)
            
            VStack{
                
                Text(address.address1)
                    .font(.title)
                    .foregroundColor(.black)
                
                Text("\(address.city),\(address.country) ")
                //                    .font(.title)
                    .foregroundColor(.gray)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        .frame(width: 300 , height: 150)
        
        
    }}

struct AddressItem_Previews: PreviewProvider {
    static var previews: some View {
        AddressItem(address:Addresss(id: 1, address1: "aya", city: "alexandria", country: "Egypt"))
        
    }
}
