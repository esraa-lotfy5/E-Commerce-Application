//
//  TemoOrderView.swift
//  E-Commerce Application
//
//  Created by Abdelrhman Ahmed on 10/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI
import Alamofire

struct TempOrderView: View {
    
    @ObservedObject var ordersViewModel = OrdersViewModel()
    @State private var currEmail = UserDefaults.standard.string(forKey: "email")
    @State private var currFirstName = UserDefaults.standard.string(forKey: "first_name")
    @State private var currLastName = UserDefaults.standard.string(forKey: "last_name")
    
    var body: some View {
        
        VStack {
            
            Button(action: {

//                getUserOrders()

            }) {

                Text("Get User Order").bold()

            }.padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(10)
                .padding()
            
            Button(action: {

                placeOrder()

            }) {

                Text("Place Order").bold()

            }.padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(10)
                .padding()
            
        }
    }
        
    func placeOrder() {
        
//        showProgressView = true
        
        print("place order clicked")
        
        let myItems: [Parameters] = [
            [
                "variant_id": 40335555395723,
                "quantity": 1
            ],
            [
                "variant_id": 40335554379915,
                "quantity": 2
            ]
        ]
        
        let shippingAddress = [
            "first_name": currFirstName ?? "",
            "last_name": currLastName ?? "",
            "address1": "123 Fake Street",
            "city": "Fakecity",
            "country": "Canada"
        ]
        
        let order: Parameters = [ "order": [
            "email": currEmail ?? "",
            "line_items": myItems,
            "shipping_address": shippingAddress
        ]
        ]
        
        print("order with email: \(currEmail), firstname: \(currFirstName) and lastname: \(currLastName)")
        
        ordersViewModel.createOrder(order: order) { result in
            
            switch result {
                
            case .success(let order):
                print("order in view: \(order)")
                
            case .failure(let error):
                // handle error
                print("error occurred")
                print("error: \(error.localizedDescription)")
            }
            
        }
    }
    
//    func getUserOrders() {
//    
//        ordersViewModel.getUserOrders { result in
//            
//            switch result {
//            
//            case .success(let response):
//                print("login screen customer: \(response)")
//                
//                let filteredOrders = response?.orders.filter {
//                    $0.email?.lowercased() == currEmail?.lowercased()
//                }
//                
//                guard let orders = filteredOrders else {
//                    
//                    print("there is no orders for this user")
//                    return
//                    
//                }
//                
//                if orders.count > 0 {
//                    print("there are \(orders.count) orders for this user")
//                    // append to your list
//                    
//                } else {
//                    print("there is no orders for this user")
//                }
//                
//                
//            case .failure(let error):
//                print("orders screen error: \(error.localizedDescription)")
//            }
//            
//        }
//        
//    }
    
}

struct TemoOrderView_Previews: PreviewProvider {
    static var previews: some View {
        TempOrderView()
    }
}
