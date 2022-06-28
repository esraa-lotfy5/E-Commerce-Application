//
//  OrderListItem.swift
//  E-Commerce Application
//
//  Created by Abdelrhman Ahmed on 11/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct OrderListItem: View {
    
    var order: Order
    
    var body: some View {
    
        VStack(alignment: .leading) {
            
            
            // order number
            // price and state
            HStack {
                
                Text("Total").bold()
                
                if let orderPrice = order.total_line_items_price {
                    
                    let price = orderPrice.components(separatedBy: ".")

                    Text("\(price[0])  \(order.currency ?? "")").bold().lineLimit(1)
                    
                }
                
                Spacer()
//                Text("\(order.financial_status ?? "")").bold().foregroundColor(.green)
                Text("\((order.financial_status == "paid") ? "Paid" : "Unpaid")").bold().foregroundColor(.green)
                
            }.font(.title).padding(.bottom, 5)
            
            // address
            Text("Shipping to: \(order.shipping_address?.address1 ?? ""), \(order.shipping_address?.city ?? ""), \(order.shipping_address?.country ?? "")").font(.headline).fontWeight(.bold).lineLimit(1)
                .padding(.bottom, 1)
            
            Divider()
            
            // line items
            ForEach(order.line_items ?? []) { item in
                
                HStack {
                    Text(item.name?.lowercased() ?? "").lineLimit(1).font(.subheadline)
                    Spacer()
                    Text("x\(item.quantity ?? 0)").bold()
                }
                
            }
            
            Divider()
            
            HStack {
            
                Text("Order #\(String(describing: order.order_number ?? -1))")
                    .foregroundColor(.gray)
                
                Spacer()
                
                let orderDate = convertDate(date: order.created_at ?? "")
                
                Text(orderDate).foregroundColor(.gray)
                
            }.font(.subheadline)
            
        }.padding()
        
    }
    
    func convertDate(date: String) -> String {
        
//        let myDateString = "2016-01-01 04:31:32"

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let originalDate = dateFormatter.date(from: date)!

        dateFormatter.dateFormat = "MMM dd, YYYY"
        let formattedDate = dateFormatter.string(from: originalDate)
        
        return formattedDate
    }
    
}

struct OrderListItem_Previews: PreviewProvider {
    static var previews: some View {
        
        let lineItems = [OrderLineItems(id: 10816359858315, name: "ADIDAS | CLASSIC BACKPACK - OS / black", price: "70.00", quantity: 1), OrderLineItems(id: 10816359891083, name: "CONVERSE | CHUCK TAYLOR ALL STAR II HI - 4 / black", price: "140.00", quantity: 2)]
        
        let shippingAddress = ShippingAddress(address1: "123 Fake Street", city: "Fakecity", country: "Canada")
        
        let order = Order(created_at: "2022-06-11T20:17:14+02:00", currency: "EGP", total_line_items_price: "350.00", email: "abdelrhman@gmail.com", financial_status: "paid", order_number: 1067, line_items: lineItems, shipping_address: shippingAddress)
        
        OrderListItem(order: order)
    }
}
