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
//    @State private var showMoreOrders: Bool = false
    
    var body: some View {
        
        VStack{
            //  ------------ start of order title --------------------
            HStack{
                Spacer().frame(width: 24)
                Text("Orders")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                Spacer()
                
                if showMoreOrders() {
                    
                    NavigationLink(destination: OrderList()
                        .navigationBarBackButtonHidden(true)
                                   //                    .navigationViewStyle(StackNavigationViewStyle())
                                   //                    .navigationBarHidden(true)
                    ){
                        
                        Text("View More..")
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
            print("will show more...")
            returnItems = 2
//            showMoreOrders = true
        }
        
        print("returned items \(returnItems)")
        return returnItems
        
    }
    
    func showMoreOrders() -> Bool {
        
        var showMore = false
        
        if ordersViewModel.orders.count == 1 {
//            returnItems = 1
        } else {
            print("will show more...")
            showMore = true
//            showMoreOrders = true
        }
        
        return showMore
        
    }
    
}

struct ProfileOrders_Previews: PreviewProvider {
    static var previews: some View {
        ProfileOrders()
    }
}
