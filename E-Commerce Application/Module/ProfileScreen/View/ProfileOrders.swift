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
    @State var orders: [Order] = []
    @State var showMore = false
    @State var returnedItems = 0
//    @State private var showMoreOrders: Bool = false
    
    var body: some View {
        
        VStack {
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
                        
                        Text("View More...")
                            .foregroundColor(.blue)
                        
                    }

                }
                
                Spacer().frame(width: 24)
            }
            .padding(.bottom, 16)
            //  ------------ end of order title ----------------------
            //  ------------ start of order grid --------------------
            
            let orders = orders.prefix(returnedItems)
            ForEach(orders) { order in

                OrderListItem(order: order)

            }
             
        }.onAppear {
            
            getOrders()
            
        }
    }
    
    func getOrders() {
        
        ordersViewModel.getUserOrders { result in
            
            print("getUserOrders \(result)")
            
            switch result {
            
            case .success(let ordersResponse):
                orders = ordersResponse ?? []
                
                print("orders profile \(orders)")
                
                if orders.count == 1 {
                    print("orders count = 1")
                    returnedItems = 1
                } else {
                    returnedItems = 2
                    print("will show more if else... \(returnedItems)")
                    showMore = true
                }
                
                print("orders in OrderList \(orders)")
                
            case .failure(let error):
                print("error \(error)")
                
            }
            
        }
        
        print("returned items \(returnedItems)")
        
    }
    
    func showMoreOrders() -> Bool {
        
        var showMore = false
        
        if orders.count == 1 {
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
