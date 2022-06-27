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
    @State var orders: [Order] = []
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
                
                ForEach(orders) { order in
                    
                    OrderListItem(order: order)
                    
                }
                
            }.listStyle(.plain)
            
        }.onAppear {
            getOrders()
        }
//        .onAppear(perform: fetch)
        
        
        
    }
    
    func getOrders(){
        
//        orders = ordersViewModel.getUserOrders()
        ordersViewModel.getUserOrders { result in
            switch result {
                
            case .success(let ordersResponse):
                orders = ordersResponse ?? []
                print("orders in OrderList \(orders)")
                
            case .failure(let error):
                print("error \(error)")
                
            }
        }
        print("profile orders \(orders)")
        
    }
    
//    func fetch(){
//        orders = ordersViewModel.orders
////        ordersViewModel.getUserOrders()
//    }
//
    
}

struct OrderList_Previews: PreviewProvider {
    static var previews: some View {
        OrderList()
    }
}
