//
//  OrderView.swift
// E-Commerce
//
//  Created by NourAllah Ahmed on 5/27/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//

import SwiftUI



struct OrderListView: View {
    @State var shoppingCartCount : Int = 0
//    @State var shoppingCartProducts : [DraftOrder] = []
    @State var counter : Int = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    @ObservedObject var shoppingCartViewModel : ShoppingCartViewModel = ShoppingCartViewModel()
    @ObservedObject var shoppingCartViewModel = ShoppingCartViewModel()
    
    init(){
        shoppingCartViewModel.getAllDraftOrders()
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
                List {
                    ForEach(shoppingCartViewModel.shoppingCartProducts) { item in
                        VStack{
                            OrderRow(product: item).opacity(0.9)
                            
                            Text("          quantity: \(item.lineItems?.first?.quantity ?? 0)")
                                .foregroundColor(.black)
                                .font(.headline)
                                .padding(5)
                            HStack{
                                Spacer()
                                
                                //TODO: deleteProduct
                                Button(action: {
                                    
                                    //TODO: delete
                                    shoppingCartViewModel.deleteDraftOrder(draftOrderID: item.id!)
                                }) {
                                    Image(systemName: "trash")
                                        .resizable()
                                        .foregroundColor(.gray)
                                        .frame(width: 25, height: 25)
                                }
                                
                                
                                Spacer()
                                Section{
                                    Stepper.init("", onIncrement: {
                                        shoppingCartViewModel.updateDraftOrder(variantId: (item.lineItems?.first?.variantId)!, quantity: ((item.lineItems?.first?.quantity)!) + 1, draftOrderID: item.id!)


                                    }, onDecrement: {
                                        if((item.lineItems?.first?.quantity)! - 1) == 0{
                                            //TODO: delete
                                            shoppingCartViewModel.deleteDraftOrder(draftOrderID: item.id!)
                                        }
                                        else{
                                            //TODO: update

                                            shoppingCartViewModel.updateDraftOrder(variantId: (item.lineItems?.first?.variantId)!, quantity: (item.lineItems?.first?.quantity)! - 1, draftOrderID: item.id!)
                                        }

                                    })
                                }
                            }
                            
                            
                        } .background(Color.white).opacity(10)
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                    } //.onDelete(perform: delete)
                }

                //MARK: TOTAL PRICE
                Section{
                    HStack{
                        VStack(alignment: .leading){
                            Text("  subTotal : \(shoppingCartViewModel.subTotalPrice , specifier: "%.2f") \(shoppingCartViewModel.shoppingCartProducts.first?.currency ?? "nil" )   " )
                            
                                .foregroundColor(.blue)
                                .font(.headline)
                            Text("  Total Tax : \(shoppingCartViewModel.totalTax ,  specifier: "%.2f") \(shoppingCartViewModel.shoppingCartProducts.first?.currency ?? "nil" ) ")
                                .foregroundColor(.blue)
                                .font(.headline)
                            Text("  Total Price: \(shoppingCartViewModel.totalPrice,  specifier: "%.2f") \(shoppingCartViewModel.shoppingCartProducts.first?.currency ?? "nil" )")
                            
                                .foregroundColor(.blue)
                                .font(.headline)
                        }
                        
                        Spacer()
                        Text("\(shoppingCartViewModel.shoppingCartProducts.count)")
                        .foregroundColor(.blue)

                    Image(systemName: "cart" )
                    .foregroundColor(.blue)
                    .padding(.trailing)
                    .padding(.top)
                    .padding(.bottom)
                    }
                    
                    NavigationLink("CheckOut",destination: AddressScreen(addressess: []).environmentObject(self.shoppingCartViewModel)
                    )

                }
            }
            
            else {
                    emptyOrderList()
                        .frame(height: UIScreen.main.bounds.size.height - 150 )
                        .onAppear{
                            print("from else")
                        }
                
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
//    private func delete(with indexSet: IndexSet) {
//
//        indexSet.forEach {
//            shoppingCartProducts.remove(at: $0)
//        }
////        self.$cartCount.wrappedValue = self.product.count
////        print($cartCount.wrappedValue)
//    }
    
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
