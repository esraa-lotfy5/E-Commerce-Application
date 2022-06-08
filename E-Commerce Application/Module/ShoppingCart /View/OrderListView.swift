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
    @State var product : [Product2] = []//display
    @State var sProduct : [Product2] = [] //calc total price
    
    @State var shoppingCartCount : Int = 0
    @State var shoppingCartProducts : [DraftOrder] = []
    @State var cartCount : Int = 0
    @State var counter : Int = 0
    @State var productPrice  : Double = 0.0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var shoppingCartViewModel : ShoppingCartViewModel = ShoppingCartViewModel()
    
    
    init(){
        shoppingCartViewModel.getAllDraftOrders()
        shoppingCartProducts = shoppingCartViewModel.shoppingCartProducts
        
    }
    var body: some View {
        VStack {
            HStack{
                HStack (alignment: .top, spacing: 0){
                    //MARK:- back button
                    Spacer().frame(width:10)
                    
                    HStack{
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }
                    .frame(width: 50, height: 40)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                }
                Spacer()
                Text("Your Orders  ").bold()
                Spacer()
            }
            
            
            if shoppingCartViewModel.shoppingCartProducts.count > 0 {
                HeaderView(header: "", cartNum: "\(self.$cartCount.wrappedValue)", image: "cart")
                List {
                    ForEach(shoppingCartViewModel.shoppingCartProducts) { item in
                        VStack{
                            OrderRow(product: item, productPrice: self.$productPrice).opacity(0.9)
                        Section{
                            Stepper.init("", onIncrement: {
//                                self.sProduct.append(item) // to calc total
                                
//                                let index = self.shoppingCartProducts.firstIndex(of: item)
//                                let pName = self.product[index!].name
//
//                                let originalProduct = self.sProduct.filter { $0.name == pName }
//
//
//                                self.product[index!].price! += (originalProduct.first?
//                                    .price!)!
                                
                            }, onDecrement: {
//                                let index = self.shoppingCartProducts.firstIndex(of: item)
//                                let pName = self.product[index!].name
//                                let originalProduct = self.sProduct.filter { $0.name == pName }
//
////                                let orignalPrice = self.sProduct[sIndex].price ?? 0.0
//                                let price =  self.product[index!].price! - (originalProduct.first?.price!)!
//                                if (price == 0.0 ) {
//                                    self.product.remove(at: index!)
//                                    self.sProduct.remove(at: self.product.firstIndex(of: originalProduct.first!)!)

//                                }else{
//                                    self.product[index!].price! = price
//                                }

//                                self.product.remove(at: self.product.firstIndex(of: item)!)
                                
                            })
                            }
                        }
                    }.onDelete(perform: delete)
                }.background(Color.white)
                    .onAppear {
//                    self.totalPrice = Int(self.product.reduce(0.0){$0 + $1.price!})
                    self.sProduct = self.product

                    self.$cartCount.wrappedValue = self.product.count
                    UITableView.appearance().separatorStyle = .none
                   
                    
                }
                //MARK: TOTAL PRICE
                Section{
                    HStack{
//                        Text("Total Price: \(Double(shoppingCartProducts.lineItems?.first?.price.reduce(0.0){$0 + ( $1.price!)} ?? 0.0)) LE")
                        Text("price")
                        .foregroundColor(.blue)
                        .font(.headline)
                        .padding()
                   Spacer()
                        Text("\(self.shoppingCartProducts.count)")
                        .foregroundColor(.blue)

                    Image(systemName: "cart" )
                    .foregroundColor(.blue)
                    .padding(.trailing)
                    .padding(.top)
                    .padding(.bottom)
                    }
                    
                    NavigationLink("CheckOut",destination:PaymentScreen(addressess: [Address(id: 1, name: "My home #1", address: "438 Dark Suprt Avenune ", city: " San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),Address(id: 2, name: "My home #2", address: "438 Dark Suprt Avenune ", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),Address(id: 3, name: "My home #3", address: "438 Dark Suprt Avenune ", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),Address(id: 4, name: "My home #4", address: "438 Dark Suprt Avenune ", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),Address(id: 5, name: "My home #4", address: "438 Dark Suprt Avenune ", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),Address(id: 6, name: "My home #5", address: "438 Dark Suprt Avenune , San Francisco ,CA, 94528", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),Address(id: 7, name: "My home #6", address: "438 Dark Suprt Avenune , San Francisco ,CA, 94528", city: "city", zipCode: 112, state: "state", defultShippingAddress: false)]))

                }
            }
            else {
                emptyOrderList()
                    .frame(height: UIScreen.main.bounds.size.height - 150 )
                    .onAppear{
                        print("from else")
                    }
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    private func delete(with indexSet: IndexSet) {
       
//        indexSet.forEach {
//            shoppingCartViewModel.deleteDraftOrder(draftOrderID: shoppingCartProducts[$0].id!)
//
//            shoppingCartProducts.remove(at: $0)
//        }
//        self.$cartCount.wrappedValue = self.product.count
//        print($cartCount.wrappedValue)

    }
    
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
    }
}

/*
 .opacity(0.5)
 .background(Image("empytshoppingcart")
 .resizable()
 .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/))
 */
