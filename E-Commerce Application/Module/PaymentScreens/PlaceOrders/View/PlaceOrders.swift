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
    @State var subTotal : Double = 976.0
    @State var shippingFees : Double = 30.0
    @State var validation : String = "Validate"
    @State var discound : Double = 0.0
    @State var total : Double = 1006.0
    
    private let currEmail = UserDefaults.standard.string(forKey: "email")
    private var currFirstName = UserDefaults.standard.string(forKey: "first_name")
    private var currLastName = UserDefaults.standard.string(forKey: "last_name")
    
    let tokenizationKey = "sandbox_rzw4gpvr_d4c5wgkkpdhthsgg"
    var amountInt :Int = 1
    var amount : NSDecimalNumber = 1000000
    
    @State var showDropIn = false
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
                    Section{
                        HStack{
                            Text("Sub Total")
                            Spacer()
                            Text("\(subTotal) USD")
                            
                        }}.padding()
                    Section{
                        HStack{
                            Text("Shipping Fees")
                            Spacer()
                            Text("\(shippingFees) USD")
                        }
                    }.padding()
                    Section{
                        HStack{
                            TextField("Cobon",text: $cobon)
                            Spacer()
                            Text(validation)
                        }
                    }.padding()
                    Section{
                        HStack{
                            Text("Discount")
                            Spacer()
                            Text("\(discound)USD")
                        }
                    }.padding()
                    
                    Section{
                        HStack{
                            Text("Grand Total")
                            Spacer()
                            Text("\(total) USD")
                            //                        Text(String(format: "%.2f", total))
                        }
                    }
                }.padding()
                
                Spacer()
                Spacer()
                
                
                
                
                
                VStack {
                    VStack {
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
                
                
            }
            
            
            
            
            
        }.navigationBarBackButtonHidden(true)
        
        //////////
        
        
        
        if self.showDropIn {
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
                            
//                            let orders = draftOrdersResponse.filter({ draftOrder in
//
//                                print("draft order on address vm: in result \(draftOrder)")
//
//                                if(draftOrder.email == currEmail ?? "") //TODO: get the current users email
//                                {
//
//                                    if (draftOrder.note == "cart"){
//
//                                        itemParameter["variant_id"] = draftOrder.lineItems?[0].variantId
//                                        itemParameter["quantity"] = draftOrder.lineItems?[0].quantity
//
//                                        lineItems.append(itemParameter)
//
////                                        draftOrders.append(DraftOrder)
//                                    }
//
//                                }
//                                return true
//                            })
                            
//                            for i in 0..<draftOrdersResponse.count {
//
//                            }
//
                            for draftOrder in orders {

        //                        lineItems.append(draftOrder.lineItems[0].variantId)
        //                        lineItems["variant_id"] = draftOrder.lineItems?[0].variantId
        //                        lineItems["quantity"] = draftOrder.lineItems?[0].quantity

        //                        lineItems.append("variant_id": draftOrder.lineItems?[0].variantId)

                                itemParameter["variant_id"] = draftOrder.lineItems?[0].variantId
                                itemParameter["quantity"] = draftOrder.lineItems?[0].quantity

                                lineItems.append(itemParameter)

                            }
//
                            placeOrder(lineItems: lineItems)
                            
                            
//                            let authenticatedCustomer = customersResponse?.customers.filter {
//                                $0.email?.lowercased() == email.lowercased() && $0.tags == password
//                            }
//
//                            print("login customer: \(authenticatedCustomer)")
//
//                            guard let customer = authenticatedCustomer else {
//
//                                showErrorMessage("Authentication Failed!")
//                                showProgressView = false
//                                return
//
//                            }
//
//                            if customer.count > 0 {
//                                print("logged in successfully \(customer)")
//
//                                UserDefaults.standard.set(customer[0].id, forKey: "id")
//                                UserDefaults.standard.set(self.email, forKey: "email")
//                                UserDefaults.standard.set(customer[0].first_name, forKey: "first_name")
//                                UserDefaults.standard.set(customer[0].last_name, forKey: "last_name")
//                                UserDefaults.standard.set(true, forKey: "isLoggedIn")
//
//                                showProgressView = false
//                                proceedWithLogin = true
//
//
//
//                            } else {
//                                showErrorMessage("Authentication Failed!")
//                                showProgressView = false
//                            }
                            
                            
                        case .failure(let error):
                            print("error while placing order: \(error)")
                            
                            
                        }
                        
                    }
//                    var lineItems = [Parameters]()
//                    var itemParameter: Parameters = [:]
//                    for draftOrder in draftOrders {
//
////                        lineItems.append(draftOrder.lineItems[0].variantId)
////                        lineItems["variant_id"] = draftOrder.lineItems?[0].variantId
////                        lineItems["quantity"] = draftOrder.lineItems?[0].quantity
//
////                        lineItems.append("variant_id": draftOrder.lineItems?[0].variantId)
//
//                        itemParameter["variant_id"] = draftOrder.lineItems?[0].variantId
//                        itemParameter["quantity"] = draftOrder.lineItems?[0].quantity
//
//                        lineItems.append(itemParameter)
//
//                    }
//
//                    placeOrder(lineItems: lineItems)
                    
//                    print("")
                    
                } else {
                    print("Ready for checkout...")
                }
                self.showDropIn = false
            }).edgesIgnoringSafeArea(.vertical)
        }
        
        
    }
    
    
    func placeOrder(lineItems: [Parameters]) {
        
        print("place order clicked")
        
//        let myItems: [Parameters] = [
//            [
//                "variant_id": 40335555395723,
//                "quantity": 1
//            ],
//            [
//                "variant_id": 40335554379915,
//                "quantity": 2
//            ]
//        ]
        
        let shippingAddress = [
            "first_name": currFirstName ?? "",
            "last_name": currLastName ?? "",
            "address1": addressViewModel.defultAddress.address1,
            "city": addressViewModel.defultAddress.city,
            "country": addressViewModel.defultAddress.country
        ]
        
        let order: Parameters = [ "order": [
            "email": currEmail ?? "",
            "line_items": lineItems,
            "shipping_address": shippingAddress
        ]
        ]
        
        print("order with email: \(currEmail), firstname: \(currFirstName) and lastname: \(currLastName)")
        print("order with address: \(addressViewModel.defultAddress.address1), city: \(addressViewModel.defultAddress.city) and country: \(addressViewModel.defultAddress.country)")
        print("order items: \(lineItems)")
        
        addressViewModel.createOrder(order: order) { result in
            
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
    
}




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
