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
  
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @StateObject var shoppingCartViewModel : ShoppingCartViewModel = ShoppingCartViewModel()
    @ObservedObject  var viewModelDiscount = DiscountCodeViewModel()

    
    @State private var IsEgp : Bool?

    @State private var Egp = UserDefaults.standard.float(forKey: "EGP")
    @State private var usd = UserDefaults.standard.float(forKey: "USD")
    @State var currencyString = UserDefaults.standard.string(forKey: "options")
    @State var isActive : Bool = false
    @State var refresh = false
    @State var promoCodeName : String = ""
    @State var shoppingCartCount : Int = 0
    @State var counter : Int = 0
    @State var errormessage :String?
    @State var IsClicked = false
    @State var NotClickableColor = Color.accentColor
    //For Loading
    @State private var currentProgress = 0.0
    
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var totalPrice : Float = 0.0
    init(){
        print("DraftORDER")
    }

    var body: some View {
        if shoppingCartViewModel.NetworkState == true {

        VStack {
            HStack{
                HStack (alignment: .top, spacing: 0){
                    //MARK: back button
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
                ScrollView {
                    //MARK: Orders
                    VStack{
                    ForEach(shoppingCartViewModel.shoppingCartProducts ) { item in
                        VStack{
                            OrderRow(product: item)
                                .opacity(0.9)
                                .padding(5)
                            //MARK: Quantity
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
                                            //MARK: delete
                                            shoppingCartViewModel.deleteDraftOrder(draftOrderID: item.id!)
                                            refresh = true
                                        }
                                        else{
                                            //MARK: update
                                            shoppingCartViewModel.updateDraftOrder(variantId: (item.lineItems?.first?.variantId)!, quantity: (item.lineItems?.first?.quantity)! - 1, draftOrderID: item.id!)
                                            refresh = true

                                        }

                                    })
                                }
                            }
                            
                            
                        }.padding()
                            .background(Color.white).opacity(10)
                            .cornerRadius(10)
                            .border(Color.gray)
                            .frame(width: UIScreen.main.bounds.width - 30)
                    }
                }.refreshable {
                    //MARK: REFRESH
                    while refresh {
                        print("refresh")
                        print(refresh)

                        await shoppingCartViewModel.refreshPage2()
                        refresh = false
                        print(refresh)
                    }
                
                }
                }

                //MARK: TOTAL PRICE
                Section{
                    HStack{
                    
                        VStack(alignment: .leading){
                            
                            VStack(alignment: .leading){
                            HStack{
                                TextField("Enter PromoCode", text: $promoCodeName).padding(15)
                               Spacer()
                                //MARK: ENTER PROMOCODE
                                Button {
                                    
                                    print("pressed \(promoCodeName)") //"SALE15OFF"
                                        self.totalPrice = self.shoppingCartViewModel.totalPrice
                                    viewModelDiscount.getDiscountValue(promo: promoCodeName )
                                    
                                     DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                         if viewModelDiscount.returnedValue != "0" {
                                             print("GET FUNCTION VALUE DISCOUNT == \(viewModelDiscount.returnedValue ?? "9")")
                                             self.shoppingCartViewModel.totalPrice  = self.shoppingCartViewModel.totalPrice + Float(viewModelDiscount.returnedValue ?? "0")!
                                             self.shoppingCartViewModel.discount = Float(viewModelDiscount.returnedValue  ?? "0.0")!
                                             
                                             //MARK: Inner check
                                             if self.totalPrice > self.shoppingCartViewModel.totalPrice{
                                                 self.IsClicked = true
                                                 self.NotClickableColor = Color.gray
                                                 self.errormessage = ""
                                             }
                                             else{
                                                 self.errormessage = " Invalid PromoCode"
                                             }
                                            print( self.shoppingCartViewModel.totalPrice)
                                         }
                                        
                                     }
                                    
                                } label: {
                                    Spacer(minLength: 3)
                                    Text("Enter")
                                        .fontWeight(.bold)
                                        .font(.body)
                                    Spacer(minLength: 3)
                                    
                                }.disabled(IsClicked)
                                    .foregroundColor(.white)
                                    .frame(height: 50)
                                    .background(NotClickableColor)
                                    .cornerRadius(15)

                            }
                                Text(self.errormessage ?? "")
                                    .foregroundColor(.red)
                                    .font(.system(size: 18))
                            }
                            if IsEgp ?? true{
                                
                                Text("  subTotal : \(shoppingCartViewModel.subTotalPrice  , specifier: "%.2f") EGP" )
                                
                                    .foregroundColor(.blue)
                                    .font(.headline)
                                Text("  Total Tax : \(shoppingCartViewModel.totalTax ,  specifier: "%.2f") EGP" )
                                    .foregroundColor(.blue)
                                    .font(.headline)
                                Text("  Total Price: \(shoppingCartViewModel.totalPrice ,  specifier: "%.2f") EGP")
                                
                                    .foregroundColor(.blue)
                                    .font(.headline)
                            }
                            else{
                                
                                    
                                    Text("  subTotal : \(shoppingCartViewModel.subTotalPrice / Egp , specifier: "%.2f" ) USD" )
                                    
                                    .foregroundColor(.blue)
                                    .font(.headline)
                                    Text("  Total Tax : \(shoppingCartViewModel.totalTax  / Egp ,  specifier: "%.2f") USD " )
                                        .foregroundColor(.blue)
                                        .font(.headline)
                                    Text("  Total Price: \(shoppingCartViewModel.totalPrice / Egp  ,  specifier: "%.2f") USD")
                                    
                                        .foregroundColor(.blue)
                                        .font(.headline)
                                
                               
                            }
                           
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
                   
                    NavigationLink( destination: AddressScreen().environmentObject(self.shoppingCartViewModel),isActive: $isActive) {
                        EmptyView()
                    }.edgesIgnoringSafeArea(.vertical)

                }
            }
            
            else {
//                ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .gray))
//                    .onReceive(timer) { _ in
//                        if currentProgress == 30.0 {
//                            currentProgress += 1
//                            print("progress")
//                            print(currentProgress)
//
//                        }
//                        else{
                            emptyOrderList()
//
//                        }
//
//                    }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 150)               }
            
        }.onAppear{
            self.IsEgp =  UserDefaults.standard.bool(forKey: "isEGP")
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
