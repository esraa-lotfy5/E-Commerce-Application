//
//  ProfileOrders.swift
//  E-Commerce Application
//
//  Created by Esraa Lotfy  on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.


import SwiftUI
//import QGrid

struct ProfileOrders: View {
    
    @ObservedObject var ordersViewModel = OrdersViewModel()
    @State private var showMoreOrders: Bool = false
    
    var body: some View {
        
        VStack{
            //  ------------ start of order title --------------------
            HStack{
                Spacer().frame(width: 24)
                Text("Orders")
                    .foregroundColor(.black)
                    .font(.headline)
                Spacer()
                
                if showMoreOrders {
                    
                    NavigationLink(destination: OrderList()
                        .navigationBarBackButtonHidden(true)
                                   //                    .navigationViewStyle(StackNavigationViewStyle())
                                   //                    .navigationBarHidden(true)
                    ){
                        
                        Text("More..")
                            .foregroundColor(.blue)
                        
                    }

                }
                
                Spacer().frame(width: 24)
            }
            .padding(.bottom, 16)
            //  ------------ end of order title ----------------------
            //  ------------ start of order grid --------------------
            
            let returnedItems = getOrderReturnNum(ordersCount: ordersViewModel.orders.count)
            
            let orders = ordersViewModel.orders.prefix(returnedItems)
            ForEach(orders) { order in
                
                OrderListItem(order: order)
                
            }
             
//            ProductRow(firstItem: dummyProducts[0], secondItem: dummyProducts[1])
        }
    }
    
    func getOrderReturnNum(ordersCount: Int) -> Int {
     
        var returnItems = 0
        
        if ordersViewModel.orders.count == 1 {
            returnItems = 1
        } else {
            returnItems = 2
            showMoreOrders = true
        }
        
        return returnItems
        
    }
    
}

struct ProfileOrders_Previews: PreviewProvider {
    static var previews: some View {
        ProfileOrders()
    }
}
