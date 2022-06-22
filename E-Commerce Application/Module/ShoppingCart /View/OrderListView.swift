//
//  OrderView.swift
// E-Commerce
//
//  Created by NourAllah Ahmed on 5/27/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//

import SwiftUI


@available(iOS 15.0, *)

struct OrderListView: View {
    @State var shoppingCartCount : Int = 0
//    @State var shoppingCartProducts : [DraftOrder] = []
    @State var counter : Int = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    @ObservedObject var shoppingCartViewModel : ShoppingCartViewModel = ShoppingCartViewModel()
    @ObservedObject var shoppingCartViewModel = ShoppingCartViewModel()
    @State var currency = UserDefaults.standard.string(forKey: "currencyString")
    @State var currencyValue = UserDefaults.standard.float(forKey: "currencyValue")
    @State var isActive : Bool = false
    @State var refresh = false
    @State var promoCodeName : String = ""

    //For Loading
    @State private var currentProgress = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    @ObservedObject  var viewModelDiscount = DiscountCodeViewModel()

    init(){
        shoppingCartViewModel.getAllDraftOrders()
    }
    var body: some View {
        if shoppingCartViewModel.NetworkState == true {

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
                    ForEach(shoppingCartViewModel.shoppingCartProducts ) { item in
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
                                            .foregroundColor(.blue)
                                            .frame(width: 25, height: 25)
                                    } .buttonStyle(BorderlessButtonStyle())
                                
                                
                                Spacer()
                                Section{
                                    Stepper.init("", onIncrement: {
                                        shoppingCartViewModel.updateDraftOrder(variantId: (item.lineItems?.first?.variantId)!, quantity: ((item.lineItems?.first?.quantity)!) + 1, draftOrderID: item.id!)
                                    
                                        refresh = true


                                    }, onDecrement: {
                                        if((item.lineItems?.first?.quantity)! - 1) == 0{
                                            //TODO: delete
                                            shoppingCartViewModel.deleteDraftOrder(draftOrderID: item.id!)
                                            refresh = true
                                        }
                                        else{
                                            //TODO: update

                                            shoppingCartViewModel.updateDraftOrder(variantId: (item.lineItems?.first?.variantId)!, quantity: (item.lineItems?.first?.quantity)! - 1, draftOrderID: item.id!)
                                            refresh = true

                                        }

                                    })
                                }
                            }
                            
                            
                        } .background(Color.white).opacity(10)
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                    } //.onDelete(perform: delete)
                }.refreshable {
                    
                    while refresh {
                        print("refresh")
                        print(refresh)

                        await shoppingCartViewModel.refreshPage2()
                        refresh = false
                        print(refresh)
                    }
                
                }

                //MARK: TOTAL PRICE
                Section{
                    HStack{
                    
                        VStack(alignment: .leading){
                            HStack(alignment: .firstTextBaseline){
                              
                                TextField("Enter PromoCode", text: $promoCodeName)
                                
                                Button {
                                    print("pressed \(promoCodeName)") //"SALE15OFF"
                                    viewModelDiscount.getDiscountValue(promo: promoCodeName )
                                     DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                         if viewModelDiscount.returnedValue != "0"{
                                             print("GET FUNCTION VALUE DISCOUNT == \(viewModelDiscount.returnedValue!)")
                                             
                                             self.shoppingCartViewModel.totalPrice  = self.shoppingCartViewModel.totalPrice + Double(viewModelDiscount.returnedValue!)!
                                             
                                             
                                            print( self.shoppingCartViewModel.totalPrice)
                                         }
//                                         else{
//                                             viewModelDiscount.getDiscountValue(promo: "SALE15OFF")
//
//                                         }
                                 
                                     }
                                    
                                } label: {
                                    Text("Enter")
                                } .foregroundColor(.white)
                                    .frame(height: 30)
                                    .background(Color.accentColor)
                                    .cornerRadius(3)

                            }
                            
                            
                            Text("  subTotal : \(shoppingCartViewModel.subTotalPrice * Double(currencyValue) , specifier: "%.2f") \(currency ?? "nil" )   " )
                            
                                .foregroundColor(.blue)
                                .font(.headline)
                            Text("  Total Tax : \(shoppingCartViewModel.totalTax * Double(currencyValue) ,  specifier: "%.2f") \(currency ?? "nil" )")
                                .foregroundColor(.blue)
                                .font(.headline)
                            Text("  Total Price: \(shoppingCartViewModel.totalPrice * Double(currencyValue) ,  specifier: "%.2f") \(currency ?? "nil" )")
                            
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
                    
                    
                    
                    Button(action: {
                        self.isActive = true
                    }) {
                        HStack {
                            Spacer()
                            Text("Check Out")
                                .fontWeight(.bold)
                                .font(.body)
                            Spacer()
                        }
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .background(Color.accentColor)
                        .cornerRadius(15)
                        .padding()
                    }
                   
                    NavigationLink( destination: AddressScreen(addressess: []).environmentObject(self.shoppingCartViewModel),isActive: $isActive) {
                        EmptyView()
                    }.edgesIgnoringSafeArea(.vertical)

                }
            }
            
            else {
                if #available(iOS 14.0, *) {
                    ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .gray))
                        .onReceive(timer) { _ in
                        if currentProgress < 30 {
                            currentProgress += 1
                        }else{
                            emptyOrderList()
                                .frame(height: UIScreen.main.bounds.size.height - 150 )
                        }
                        
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 150)               }
                                   
            }
        }
        .navigationBarBackButtonHidden(true)
        }
        
    else{
        NoNetworkView()
    }
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
        if #available(iOS 15.0, *) {
            OrderListView()
        } else {
            // Fallback on earlier versions
        }
    }
}

/*
 .opacity(0.5)
 .background(Image("empytshoppingcart")
 .resizable()
 .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/))
 */
