//
//  OrdersView.swift
//  E-Commerce Application
//
//  Created by Abdelrhman Ahmed on 08/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI
import Alamofire

struct OrdersView: View {
    
    @ObservedObject var ordersViewModel = OrdersViewModel()
    
    var body: some View {
        VStack {
            
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
    
    func placeOrder(){
        
//        showProgressView = true
        
        
        
        
        
//        {
//            "customer": {
//                "first_name": "Steve",
//                "last_name": "Lastnameson",
//                "email": "steve.lastnameson@example.com",
//                "phone": "+15142546011",
//                "password": "somePass",
//                "password_confirmation": "somePass"
//            }
//        }
//
//        let customer: Parameters = [ "customer": [
//            "first_name": firstName,
//            "last_name": lastName,
//            "email": email,
//            "phone": phone,
//            "tags": password
//        ]
//        ]
        
//        {
//            "order": {
//                "email": "tagging@gmail.com",
//                "line_items": [
//                    {
//                        "variant_id": 40335555395723,
//                        "quantity": 1
//                    },
//                    {
//                        "variant_id": 40335554379915,
//                        "quantity": 2
//                    }
//                ]
//            }
//        }
        
        print("place order clicked")
        
//        let items : [String: Any] = [ "variant_id": 40335555395723, "quantity": 1 ]
        
//        let items: Para = [
//            [
//                "variant_id": 40335555395723,
//                "quantity": 1
//            ],
//            [
//                "variant_id": 40335554379915,
//                "quantity": 2
//            ]
//        ]
        
        
//        let order: Parameters = [ "order": [
//            "email": "tagging@gmail.com",
//            "line_items": [
//                [
//                "variant_id": 40335555395723,
//                "quantity": 1
//                ],
//                [
//                    "variant_id": 40335555395723,
//                    "quantity": 1
//                ]
//            ]
//        ]
//        ]
        
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
        
        let order: Parameters = [ "order": [
            "email": "tagging1235235532@gmail.com",
            "line_items": myItems
        ]
        ]
        
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
                
//        ordersViewModel.registerCustomer(customer: customer) { result in
//
//            switch result {
//
//            case .success(let customer):
//                print("customer id in register screen: \(customer?.id)")
////                proceedWithPlaceOrder = true
////                showProgressView = false
//
//            case .failure(let error):
////                showErrorMessage(error.localizedDescription)
////                showProgressView = false
//            }
//
//        }
        
    }
    
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}
