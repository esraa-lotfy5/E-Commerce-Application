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
    @State private var currEmail = UserDefaults.standard.string(forKey: "email")
    
    var body: some View {
    
        List {
            
            ForEach(ordersViewModel.orders) { order in
                
                OrderListItem(order: order)
                
            }
            
        }.listStyle(.plain)
        
    }
    
    
}

struct OrderList_Previews: PreviewProvider {
    static var previews: some View {
        OrderList()
    }
}
