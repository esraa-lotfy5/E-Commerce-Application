//
//  PaymentScreens.swift
//  E-Commerce Application
//
//  Created by Aya Abdelraouf on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI
import StepperView
import BraintreeDropIn

struct PaymentScreen: View {
    
    let steps = [
        TextView(text: "Address", font: Font.system(size: 12, weight: Font.Weight.regular )),
        TextView(text: "Payment Options", font: Font.system(size: 12, weight: Font.Weight.regular)),
        TextView(text: "Order", font: Font.system(size: 12, weight: Font.Weight.regular))
    ]
    
    let indicators = [
        StepperIndicationType.custom(Image(systemName:"1.circle.fill").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image(systemName:"2.circle").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image(systemName:"3.circle").font(.largeTitle).eraseToAnyView())
    ]
    
    var addressess : [FakeAddress]
    @State var  name : String = ""
    @State var address :String = ""
    @State var city :String = ""
    @State var state :String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    let colorGray = Color(red: 232/255, green: 232/255, blue: 232/255)
    
    //view Model
    
    @ObservedObject  var vm = AddressViewModel()
    
   @State var active :Bool = false
    
    
    var body: some View {
        
        VStack {
            
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
                        
                        VStack{
                            Spacer().frame(height:100)
                            StepsC(steps: steps, indicators: indicators)
                        }
                        .padding(.all)
                        Spacer()
                        Spacer()
                        
                    }.frame(height:200)
                }
                ScrollView(.horizontal,showsIndicators: false){
                    
                    HStack(alignment :.top,spacing: 10){
                        ForEach(vm.comingAddressess){ address in
                            AddressItem(address: address)
                        }
                    }.padding()
                }
            }
            
            VStack {
                
                
                TextField("Name", text: self.$name)
                    .padding()
                    .padding(.bottom, -25)
                    .foregroundColor(Color.blue)
                
                Divider().padding()
                
                TextField("Address", text: self.$address)
                    .padding()
                    .padding(.bottom, -15)
                    .foregroundColor(Color.blue)
                
                Divider().padding().padding(.top, -15)
                
                TextField("City", text: self.$city)
                    .padding()
                    .padding(.bottom, -15)
                    .foregroundColor(Color.blue)
                
                Divider().padding().padding(.top, -15)
                
                TextField("State", text: self.$state)
                    .padding()
                    .padding(.bottom, -15)
                    .foregroundColor(Color.blue)
                
                Divider().padding().padding(.top, -15)
                
            }
            
            
            
            Spacer()
            
            
            NavigationLink(destination: PaymentOptions(),isActive: $active) {
                
             EmptyView()
            }
            
            Button(action:{
                
                let addressPar  = [
                
                    "address" :[
                    
                        "address1": address,
                        "city": city,
                        "country": state
                    
                    
                    ]
                
                ]
                print(addressPar)
                vm.postApi(address: addressPar)
                self.active = true
                
            }, label:{
                Text("SAVE")
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth :.infinity)
                    .background(Color.accentColor)
                    .cornerRadius(15)
            } )
            .padding()
            
        }.navigationBarBackButtonHidden(true)
    }
    
}

struct PaymentOptions: View {
    @State private var paymentIndex = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var paymentsOptions = ["PayPal","Cash On Delivery"]
    
    let steps = [
        TextView(text: "Address", font: Font.system(size: 12, weight: Font.Weight.regular)),
        TextView(text: "Payment Options", font: Font.system(size: 12, weight: Font.Weight.regular)),
        TextView(text: "Order", font: Font.system(size: 12, weight: Font.Weight.regular))
    ]
    
    let indicators = [
        StepperIndicationType.custom(Image(systemName:"1.circle.fill").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image(systemName:"2.circle.fill").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image(systemName:"3.circle").font(.largeTitle).eraseToAnyView())
    ]
    var body: some View {
        
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
                
                VStack{
                    Spacer().frame(height:100)
                    StepsC(steps: steps, indicators: indicators)
                }
                .padding(.all)
                Spacer()
                Spacer()
                
            }.frame(height:200)
            
            
            Spacer()
            
            
            Picker(selection:$paymentIndex, label: Text("Payments")) {
                ForEach (0 ..< paymentsOptions.count){
                    Text(self.paymentsOptions[$0]).tag($0)
                }
            }
            .padding(.leading, 10)
            Spacer()
            Spacer()
            Spacer()
            NavigationLink(destination: OrderPayments()) {
                Text("Next").bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
            }
            Spacer()
        }.navigationBarBackButtonHidden(true)
        
        
        
    }
}

struct OrderPayments: View {
    
    let steps = [
        TextView(text: "Address", font: Font.system(size: 12, weight: Font.Weight.regular)),
        TextView(text: "Payment Options", font: Font.system(size: 12, weight: Font.Weight.regular)),
        TextView(text: "Order", font: Font.system(size: 12, weight: Font.Weight.regular))
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
    
    
    
    let tokenizationKey = "sandbox_rzw4gpvr_d4c5wgkkpdhthsgg"
    var amountInt :Int = 1
    var amount : NSDecimalNumber = 1000000
   
    @State var showDropIn = false
    
    var body: some View {
        let size = Decimal(amountInt)
        let test = pow(size, 2) - 1
        let resultD = NSDecimalNumber(decimal: test)
        
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
                
                VStack{
                    Spacer().frame(height:100)
                    StepsC(steps: steps, indicators: indicators)
                }
                .padding(.all)
                Spacer()
                Spacer()
                
            }.frame(height:200)
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
                
                
            }.navigationBarBackButtonHidden(true)
            
            //////////
            
            Button(action: { self.showDropIn = true }) {
                HStack {
                    Spacer()
                    Text("Select Payment Method")
                        .fontWeight(.bold)
                        .font(.body)
                    Spacer()
                }
                .padding(.vertical, 12)
                .foregroundColor(.white)
                .background(Color.blue)
            }
            .padding(.top, 40)
            .padding(.horizontal, 20)
            Spacer()
        }.edgesIgnoringSafeArea(.vertical)
        
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
                    
                } else {
                    print("Ready for checkout...")
                }
                self.showDropIn = false
            }).edgesIgnoringSafeArea(.vertical)
        }
            
            Spacer()
            Spacer()
            Spacer()
        }
        
        
        
    }


struct StepsV: View {
    var steps : [Text]
    
    
    var indicationTypes : [StepperIndicationType<NumberedCircleView>]
    
    var body: some View {
        StepperView()
            .addSteps(steps)
            .indicators(indicationTypes)
            .stepIndicatorMode(StepperMode.horizontal)
            .spacing(30)
            .lineOptions(StepperLineOptions.custom(1, Colors.blue(.teal).rawValue))    }
}

struct StepsC: View {
    var steps : [TextView]
    
    var indicators :[StepperIndicationType<AnyView>]
    
    var body: some View {
        StepperView()
            .addSteps(steps)
            .indicators(indicators)
            .stepIndicatorMode(StepperMode.horizontal)
            .lineOptions(StepperLineOptions.rounded(4, 8, Color.black))
            .stepLifeCycles([StepLifeCycle.completed, .completed, .completed, .pending])
            .spacing(50)}
}

struct PaymentScreen_Previews: PreviewProvider {
    static var previews: some View {
        PaymentScreen(addressess: [FakeAddress(id: 1, name: "My home #1", address: "438 Dark Suprt Avenune ", city: " San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),FakeAddress(id: 2, name: "My home #2", address: "438 Dark Suprt Avenune ", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),FakeAddress(id: 3, name: "My home #3", address: "438 Dark Suprt Avenune ", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),FakeAddress(id: 4, name: "My home #4", address: "438 Dark Suprt Avenune ", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),FakeAddress(id: 5, name: "My home #4", address: "438 Dark Suprt Avenune ", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),FakeAddress(id: 6, name: "My home #5", address: "438 Dark Suprt Avenune , San Francisco ,CA, 94528", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),FakeAddress(id: 7, name: "My home #6", address: "438 Dark Suprt Avenune , San Francisco ,CA, 94528", city: "city", zipCode: 112, state: "state", defultShippingAddress: false)] )
        //        OrderPayments()
        //        PaymentOptions()
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
