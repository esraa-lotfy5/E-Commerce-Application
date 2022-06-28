//
//  PlaceOrders.swift
//  E-Commerce Application
//
//  Created by Aya Abdelraouf on 08/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

import StepperView
import BraintreeDropIn
import Alamofire


struct PlaceOrders: View {
    
    let steps = [
        TextView(text: " \(" ") Address", font: Font.system(size: 12, weight: Font.Weight.regular)),
        TextView(text: " \(" ") Payment Options", font: Font.system(size: 12, weight: Font.Weight.regular)),
        TextView(text: " \(" ") Order", font: Font.system(size: 12, weight: Font.Weight.regular))
    ]
    
    let indicators = [
        StepperIndicationType.custom(Image(systemName:"1.circle.fill").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image(systemName:"2.circle.fill").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image(systemName:"3.circle.fill").font(.largeTitle).eraseToAnyView())
    ]
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var cobon = ""
    @State var subTotal : Float = 0.0
    @State var tax : Double = 0.0

    @State var shippingFees : Float = 0.0
    @State var validation : String = "Validate"
    @State var discound : Float = 0.0
    @State var total : Float = 0.0
    @State private var showProgressView: Bool = false
    
    @State private var IsEgp : Bool?

    @State private var Egp = UserDefaults.standard.float(forKey: "EGP")
    @State private var usd = UserDefaults.standard.float(forKey: "USD")
    @State var currencyString = UserDefaults.standard.string(forKey: "options")
    @State private var PaymentOptions = UserDefaults.standard.string(forKey: "PaymentOptions")
    @State private var isPayPal = UserDefaults.standard.bool(forKey: "isPay")
    @State var active :Bool = false
    
    var address :Addresss
    
   // @EnvironmentObject var  vm :AddressViewModel
    
    let tokenizationKey = "sandbox_rzw4gpvr_d4c5wgkkpdhthsgg"
    var amountInt :Int = 1
    var amount : NSDecimalNumber = 1000000
    
    @State var showDropIn = false
    
    @EnvironmentObject var shoppingCartViewModel : ShoppingCartViewModel
    
     let currEmail = UserDefaults.standard.string(forKey: "email")
    var currFirstName = UserDefaults.standard.string(forKey: "first_name")
    var currLastName = UserDefaults.standard.string(forKey: "last_name")
       var currency = UserDefaults.standard.string(forKey: "currencyString")
    @ObservedObject var addressViewModel = AddressViewModel()

    
    
    var body: some View {
        let size = Decimal(amountInt)
        let test = pow(size, 2) - 1
        let resultD = NSDecimalNumber(decimal: test)
        
        VStack {
            
            
            Spacer()
            StepsC(steps: steps, indicators: indicators)
            
            Spacer()
            Spacer()
            
            
            VStack(alignment: .leading){
                Spacer()
                Form{
                    
                    
                    if IsEgp ?? true {
                        Section{
                            HStack{
                                Text("Sub Total")
                                Spacer()
                                Text("\(subTotal,  specifier: "%.2f") EGP ")
                            }}.padding()
                        Section{
                            HStack{
                                Text("Shipping Fees")
                                Spacer()
                                Text("\(shippingFees,  specifier: "%.2f") EGP ")                        }
                        }.padding()
                       
                        Section{
                            HStack{
                                //MARK: Discount
                                Text("Discount")
                                Spacer()
                                Text("\(discound,  specifier: "%.2f") EGP")                        }
                        }.padding()
                        
                        Section{
                            HStack{
                                Text("Grand Total")
                                Spacer()
                                Text("\(total,  specifier: "%.2f") EGP " )
                            }
                        }
                        .padding()
                    }
                    else{
       
                        
                        
                        Section{
                            HStack{
                                Text("Sub Total")
                                Spacer()
                                Text("\(subTotal / Egp , specifier: "%.2f") USD")
                            }}.padding()
                        Section{
                            HStack{
                                Text("Shipping Fees")
                                Spacer()
                                Text("\(shippingFees / Egp , specifier: "%.2f") USD"    )                  }
                        }.padding()
                       
                        Section{
                            HStack{
                                //MARK: Discount
                                Text("Discount")
                                Spacer()
                                Text("\(discound / Egp , specifier: "%.2f") USD"  )                     }
                        }.padding()
                        
                        Section{
                            HStack{
                                Text("Grand Total")
                                Spacer()
                                Text("\(total / Egp , specifier: "%.2f") USD")
                            }
                        }
                        .padding()
                    }
                    
                    
                
                Spacer()
                Spacer()
                
                
            }
            
        }.navigationBarBackButtonHidden(true)
            .onAppear{
                print("___PAYMENT___")
                
                
                
                
                self.total = self.shoppingCartViewModel.totalPrice
                
                
                self.subTotal = self.shoppingCartViewModel.subTotalPrice
                
                self.shippingFees = self.shoppingCartViewModel.totalTax
                
                
                self.discound = self.shoppingCartViewModel.discount
                self.IsEgp =  UserDefaults.standard.bool(forKey: "isEGP")
                
                print(self.total)
            }
        
        //////////
        NavigationLink(destination: ProfileScreen(),isActive: $active) {

            EmptyView()
        }.edgesIgnoringSafeArea(.vertical)
        
        if self.isPayPal{
            
            VStack {
                VStack {
                    HStack (alignment: .center, spacing: 0){
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
                        Spacer().frame(width:50)
                        
                        NavigationLink(destination: Text("")) {
                            
                            Button(action: { self.showDropIn = true }) {
                                HStack {
                                    Spacer()
                                    Text("Select Payment Method")
                                        .fontWeight(.bold)
                                        .font(.body)
                                    Spacer()
                                }
                                .foregroundColor(.white)
                                .frame(height: 55)
                                .background(Color.accentColor)
                                .cornerRadius(15)
                            }
                            
                            Spacer()
                        }.edgesIgnoringSafeArea(.vertical)
                        
                        
                        
                        
                    }.frame(height:200)
                }
                
            }
            
          if  self.showDropIn{
        
            BTDropInRepresentable(authorization: tokenizationKey, amount: resultD,handler: { controller, result, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if result != nil{
                    // Update your UI
                    let type = result?.paymentMethodType
                    let icon = result?.paymentIcon
                    let description = result?.paymentDescription
                    
                    // Use the payment method to transact
                    let paymentMethod = result?.paymentMethod
                    print("\(String(describing: type))🎲")
                    print("\(String(describing: paymentMethod))🎲")
                    print("\(String(describing: description))🎲")
                    
                    addressViewModel.getAllDraftOrders { result in
                        
                        switch result {
                        
                        case .success(let draftOrders):
                            print("place order screen draft orders: \(draftOrders)")
                            
                            var lineItems = [Parameters]()
                            var itemParameter: Parameters = [:]
                            
                            guard let draftOrdersResponse = draftOrders?.draftOrders else {
                                return
                            }
                            
                            let orders = draftOrdersResponse.filter {
                                $0.email?.lowercased() == currEmail?.lowercased()
                            }
                            
                            for draftOrder in orders {

                                itemParameter["variant_id"] = draftOrder.lineItems?[0].variantId
                                itemParameter["quantity"] = draftOrder.lineItems?[0].quantity

                                lineItems.append(itemParameter)

                            }
//
                            placeOrderPayPal(lineItems: lineItems)
                            
                            
                        case .failure(let error):
                            print("error while placing order: \(error)")
                            
                            
                        }
                        
                    }
                    
                } else {
                    print("Ready for checkout...")
                }
                self.showDropIn = false
                self.active = true
            }).edgesIgnoringSafeArea(.vertical)
            }
            
        } else {
            
            VStack {
                VStack {
                    HStack (alignment: .center, spacing: 0){
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
                        Spacer().frame(width:50)
                        
                            
                            Button(action: {
                                
                                showProgressView = true
                                
                                
                                
                                addressViewModel.getAllDraftOrders { result in
                                    
                                    switch result {
                                    
                                    case .success(let draftOrders):
                                        print("place order screen draft orders: \(draftOrders)")
                                        
                                        var lineItems = [Parameters]()
                                        var itemParameter: Parameters = [:]
                                        
                                        guard let draftOrdersResponse = draftOrders?.draftOrders else {
                                            return
                                        }
                                        
                                        let orders = draftOrdersResponse.filter {
                                            $0.email?.lowercased() == currEmail?.lowercased()
                                        }
                                        
                                        for draftOrder in orders {

                                            itemParameter["variant_id"] = draftOrder.lineItems?[0].variantId
                                            itemParameter["quantity"] = draftOrder.lineItems?[0].quantity

                                            lineItems.append(itemParameter)

                                        }
                //
                                        placeOrderCash(lineItems: lineItems)
                                        
                                        
                                    case .failure(let error):
                                        print("error while placing order: \(error)")
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            ) {
                                
                                if showProgressView {
                                    
                                    if #available(iOS 14.0, *) {
                                        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white))
                                            .frame(maxWidth: .infinity)
                                    }
                                    
                                } else {
                                    
                                    HStack {
                                        Spacer()
                                        Text("Pay Cash on Delivery")
                                            .fontWeight(.bold)
                                            .font(.body)
                                        Spacer()
                                    }
                                    
                                    
                                }
                                
                            }
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .background(Color.accentColor)
                            .cornerRadius(15)
                            
                            Spacer()
                        
                        
                        
                    }.frame(height:200)
                }
                
            }
            
        }
        
    }
    
    }
    func placeOrderPayPal(lineItems: [Parameters]) {
        
        print("place order clicked")

        let shippingAddress = [
            "first_name": currFirstName ?? "",
            "last_name": currLastName ?? "",
            "address1": address.address1,
            "city": address.city,
            "country": address.country
        ]
        
        let order: Parameters = [ "order": [
            "email": currEmail ?? "",
            "currency": currency ?? "EGP",
            "line_items": lineItems,
            "shipping_address": shippingAddress
        ]
        ]
        
        print("order with email: \(currEmail), firstname: \(currFirstName) and lastname: \(currLastName)")
        print("order with address: \(address.address1), city: \(address.city) and country: \(address.country)")
        print("order items: \(lineItems)")
        
        addressViewModel.createOrder(order: order) { result in
            
            switch result {
                
            case .success(let order):
                print("order in view: \(order)")
//                shoppingCartViewModel.deleteAllDraftOrder()
                
            case .failure(let error):
                // handle error
                print("error occurred")
                print("error: \(error.localizedDescription)")
            }
            
        }
    }
    
    
    func placeOrderCash(lineItems: [Parameters]) {
        
        print("place order clicked")
        showProgressView = true

        let shippingAddress = [
            "first_name": currFirstName ?? "",
            "last_name": currLastName ?? "",
            "address1": address.address1,
            "city": address.city,
            "country": address.country
        ]
        
        let order: Parameters = [ "order": [
            "email": currEmail ?? "",
            "currency": currency ?? "EGP",
            "line_items": lineItems,
            "shipping_address": shippingAddress,
            "financial_status": "pending"
            
        ]
        ]
        
        print("order with email: \(currEmail), firstname: \(currFirstName) and lastname: \(currLastName)")
        print("order with address: \(address.address1), city: \(address.city) and country: \(address.country)")
        print("order items: \(lineItems)")
        
        addressViewModel.createOrder(order: order) { result in
            
            switch result {
                
            case .success(let order):
                print("order in view: \(order)")
                active = true
                showProgressView = false
                
//                shoppingCartViewModel.deleteAllDraftOrder()
                
            case .failure(let error):
                // handle error
                print("error occurred")
                print("error: \(error.localizedDescription)")
                showProgressView = false
            }
            
        }
    }
    
}

//func pay



struct BTDropInRepresentable: UIViewControllerRepresentable {
    var authorization: String
    var handler: BTDropInControllerHandler
    var amount : NSDecimalNumber
    
    init(authorization: String,amount :NSDecimalNumber, handler: @escaping BTDropInControllerHandler) {
        self.authorization = authorization
        self.handler = handler
        self.amount = amount
    }
    
    func makeUIViewController(context: Context) -> BTDropInController {
        
        let request = BTDropInRequest()
        
        let threeDSecureRequest = BTThreeDSecureRequest()
        
        threeDSecureRequest.amount = amount
        
        request.threeDSecureRequest = threeDSecureRequest
        
        request.vaultManager = true
        
        
        
        
        let bTDropInController = BTDropInController(authorization: authorization, request: request, handler: handler)!
        
        
        return bTDropInController
    }
    
    func updateUIViewController(_ uiViewController: BTDropInController, context: UIViewControllerRepresentableContext<BTDropInRepresentable>) {
    }
}

