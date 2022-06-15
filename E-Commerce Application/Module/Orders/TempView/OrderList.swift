//
//  OrderList.swift
//  E-Commerce Application
//
//  Created by Abdelrhman Ahmed on 12/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct OrderList: View {
    
    @ObservedObject var ordersViewModel = OrdersViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    @State private var currEmail = UserDefaults.standard.string(forKey: "email")
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
                    .frame(width: 50, height: 40)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                    .padding(.leading, 20)
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                
                Spacer()
                
                Text("Orders").bold().font(.largeTitle)
                Spacer()
                Spacer()
                
            }
        
            List {
                
                ForEach(ordersViewModel.orders) { order in
                    
                    OrderListItem(order: order)
                    
                }
                
            }.listStyle(.plain)
            
        }
        
        
        
    }
    
    
}

struct OrderList_Previews: PreviewProvider {
    static var previews: some View {
        OrderList()
    }
}
