//
//  OrderView.swift
// E-Commerce
//
//  Created by NourAllah Ahmed on 5/27/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//

import SwiftUI

struct Product2 : Hashable , Identifiable {
    var id  = UUID()
    var name : String?
    var price : Double?
    var size: String?
    var desc: String?
    
}

struct OrderListView: View {
    @State var product : [Product2] //display
    @State var sProduct : [Product2] = [] //calc total price
    @State var cartCount : Int = 0
    @State var counter : Int = 0
    @State var productPrice  : Double = 0.0


    var body: some View {
        NavigationView{
        VStack {
            if product.count != 0 {
                HeaderView(header: "Your Orders", cartNum: "\(self.$cartCount.wrappedValue)", image: "cart")
                List {
                    ForEach(product , id: \.self) { item in
                        VStack{
                        OrderRow(product: item, productPrice: self.$productPrice).opacity(0.9)
                        Section{
                            Stepper.init("", onIncrement: {
//                                self.sProduct.append(item) // to calc total
                                
                                let index = self.product.firstIndex(of: item)
                                let pName = self.product[index!].name

                                let originalProduct = self.sProduct.filter { $0.name == pName }

                                
                                self.product[index!].price! += (originalProduct.first?
                                    .price!)!
                                
                            }, onDecrement: {
                                let index = self.product.firstIndex(of: item)
                                let pName = self.product[index!].name
                                let originalProduct = self.sProduct.filter { $0.name == pName }
                               
//                                let orignalPrice = self.sProduct[sIndex].price ?? 0.0
                                let price =  self.product[index!].price! - (originalProduct.first?.price!)!
                                if (price == 0.0 ) {
                                    self.product.remove(at: index!)
//                                    self.sProduct.remove(at: self.product.firstIndex(of: originalProduct.first!)!)

                                }else{
                                    self.product[index!].price! = price
                                }

//                                self.product.remove(at: self.product.firstIndex(of: item)!)
                                
                            })
                            }
                        }
                    }.onDelete(perform: delete)
                }.onAppear {
//                    self.totalPrice = Int(self.product.reduce(0.0){$0 + $1.price!})
                    self.sProduct = self.product

                    self.$cartCount.wrappedValue = self.product.count
                    UITableView.appearance().separatorStyle = .none
                    
                }
                //MARK: TOTAL PRICE
                Section{
                    HStack{
                    Text("Total Price: \(Int(product.reduce(0.0){$0 + ( $1.price!)})) LE")
                        .foregroundColor(.blue)
                        .font(.headline)
                        .padding()
                   Spacer()
                        Text("\(self.product.count)")
                        .foregroundColor(.blue)

                    Image(systemName: "cart" )
                    .foregroundColor(.blue)
                    .padding(.trailing)
                    .padding(.top)
                    .padding(.bottom)
                    }
                    
                    NavigationLink("CheckOut",destination:PaymentScreen(addressess: [Address(id: 1, name: "My home #1", address: "438 Dark Suprt Avenune ", city: " San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),Address(id: 2, name: "My home #2", address: "438 Dark Suprt Avenune ", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),Address(id: 3, name: "My home #3", address: "438 Dark Suprt Avenune ", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),Address(id: 4, name: "My home #4", address: "438 Dark Suprt Avenune ", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),Address(id: 5, name: "My home #4", address: "438 Dark Suprt Avenune ", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),Address(id: 6, name: "My home #5", address: "438 Dark Suprt Avenune , San Francisco ,CA, 94528", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),Address(id: 7, name: "My home #6", address: "438 Dark Suprt Avenune , San Francisco ,CA, 94528", city: "city", zipCode: 112, state: "state", defultShippingAddress: false)]))
//                    {
//                         print(Int(self.product.reduce(0.0){$0 + $1.price!})) 
//                    }
//                    Button("CheckOut" , action: {
//                        print(Int(self.product.reduce(0.0){$0 + $1.price!})) })
                }
                }
            else {
                emptyOrderList()
            }
        }
        }
    }
    
    private func delete(with indexSet: IndexSet) {
        indexSet.forEach {
            product.remove(at: $0)
        }
        self.$cartCount.wrappedValue = self.product.count
        print($cartCount.wrappedValue)

    }
    
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView( product: [])
    }
}

/*
 .opacity(0.5)
 .background(Image("empytshoppingcart")
 .resizable()
 .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/))
 */
