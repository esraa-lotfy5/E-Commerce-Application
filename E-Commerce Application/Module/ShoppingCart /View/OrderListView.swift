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
    @State var shoppingCartCount : Int = 0
    @State var shoppingCartProducts : [DraftOrder] = []
    @State var cartCount : Int = 0
    @State var counter : Int = 0
    @State var productPrice  : Double = 0.0
    @State var totalPrice : Double = 0.0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var shoppingCartViewModel : ShoppingCartViewModel = ShoppingCartViewModel()
    
    
    init(){
        shoppingCartViewModel.getAllDraftOrders()
//        shoppingCartProducts = shoppingCartViewModel.shoppingCartProducts
        
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
                                counter += 1
                                shoppingCartViewModel.updateDraftOrder(variantId: (item.lineItems?.first?.variantId)!, quantity: (item.lineItems?.first?.quantity)! + 1, draftOrderID: item.id!)
                                shoppingCartViewModel.getAllDraftOrders()
                                
                            }, onDecrement: {
                                if((item.lineItems?.first?.quantity)! - 1) == 0{
                                    //TODO: delete
                                    shoppingCartViewModel.deleteDraftOrder(draftOrderID: item.id!)
                                    shoppingCartViewModel.getAllDraftOrders()
                                    
                                }
                                else{
                                    //TODO: update
                                shoppingCartViewModel.updateDraftOrder(variantId: (item.lineItems?.first?.variantId)!, quantity: (item.lineItems?.first?.quantity)! - 1, draftOrderID: item.id!)
                                shoppingCartViewModel.getAllDraftOrders()
                                }
                                
                            })
                            }
                        }
                    }.onDelete(perform: delete)
                }.background(Color.white)
                    .onAppear {
                        
                        UITableView.appearance().separatorStyle = .none
                    }
                //MARK: TOTAL PRICE
                Section{
                    HStack{
                        VStack(alignment: .leading){
                            //\(shoppingCartViewModel.shoppingCartProducts.first?.currency)
                            Text("subTotal : \(shoppingCartViewModel.subTotalPrice , specifier: "%.2f") " )
                            .foregroundColor(.blue)
                            .font(.headline)
                        Text("Total Tax : \(shoppingCartViewModel.totalTax ,  specifier: "%.2f") ")
                            .foregroundColor(.blue)
                            .font(.headline)
                        Text("Total Price: \(shoppingCartViewModel.totalPrice,  specifier: "%.2f") ")

                        .foregroundColor(.blue)
                        .font(.headline)
                        }
                        
                        Spacer()
                        Text("\(self.shoppingCartProducts.count)")
                        .foregroundColor(.blue)

                    Image(systemName: "cart" )
                    .foregroundColor(.blue)
                    .padding(.trailing)
                    .padding(.top)
                    .padding(.bottom)
                    }
                    
                    NavigationLink("CheckOut",destination: AddressScreen())

                }.onAppear{
                  
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
