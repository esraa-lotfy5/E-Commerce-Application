//
//  AddressScreen.swift
//  E-Commerce Application
//
//  Created by Aya Abdelraouf on 08/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//
import SwiftUI
import StepperView
import BraintreeDropIn

struct AddressScreen: View {
    @EnvironmentObject var shoppingCartViewModel : ShoppingCartViewModel
    let steps = [
        TextView(text: " \(" ") Address", font: Font.system(size: 12, weight: Font.Weight.regular )),
        TextView(text: " \(" ") Payment Options", font: Font.system(size: 12, weight: Font.Weight.regular)),
        TextView(text: "\(" ") Order", font: Font.system(size: 12, weight: Font.Weight.regular))
    ]
    
    let indicators = [
        StepperIndicationType.custom(Image(systemName:"1.circle.fill").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image(systemName:"2.circle").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image(systemName:"3.circle").font(.largeTitle).eraseToAnyView())
    ]
    
    
    @State var  name : String = ""
    @State var address1 :String = ""
    @State var city :String = ""
    @State var state :String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    
    let colorGray = Color(red: 232/255, green: 232/255, blue: 232/255)
    
    //view Model
    
    @ObservedObject  var vm = AddressViewModel()
    
    @State var active :Bool = false
    
    @State var address : [Addresss] = []
    
    @State var errorMessage: String = ""
    var body: some View {
        
        
        VStack {
            
            
            Spacer()
            StepsC(steps: steps, indicators: indicators)
            Spacer()
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack(alignment :.top,spacing: 10){
                    ForEach(address){ address in
                        AddressItem(address: address)
                            .environmentObject(self.shoppingCartViewModel)
                    }
                }.padding()
            }
            VStack {
                
                
                
                TextField("Address", text: self.$address1)
                    .padding()
                    .padding(.bottom, -15)
                    .foregroundColor(Color.blue)
                
                Divider().padding().padding(.top, -15)
                
                TextField("City", text: self.$city)
                    .padding()
                    .padding(.bottom, -15)
                    .foregroundColor(Color.blue)
                
                Divider().padding().padding(.top, -15)
                
                TextField("Country", text: self.$state)
                    .padding()
                    .padding(.bottom, -15)
                    .foregroundColor(Color.blue)
                
                Divider().padding().padding(.top, -15)
                
            }
            
            
            
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
                        NavigationLink(destination: PaymentOptions(address: vm.defultAddress).environmentObject(self.shoppingCartViewModel),isActive: $active) {
                                                   
                                                   EmptyView()
                                               }.edgesIgnoringSafeArea(.vertical)
                        
                        Button(action: {
                            let addressPar  = [
                                
                                "address" :[
                                    
                                    "address1": address1,
                                    "city": city,
                                    "country": state
                                    
                                    
                                ]
                                
                            ]
                            print(addressPar)
                            
                            
                           
                        
                            
                            
                        }) {
                            HStack {
                                Spacer()
                                Text("Add Address")
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
                        
                        
                        
                        
                        
                    }.frame(height:200)
                }
                
            }.navigationBarBackButtonHidden(true)
            
                
            
        
            
        }.onAppear{
            getAddress()
        }
        
        }
    func getAddress(){
        
//        orders = ordersViewModel.getUserOrders()
        vm.getAddress { result in
            switch result {
                
            case .success(let ordersResponse):
                address = ordersResponse ?? []
                print("orders in OrderList \(address)")
                
            case .failure(let error):
                print("error \(error)")
                
            }
        }
        print("profile orders \(address)")
        
    }
    
    func validateData() -> Bool {
        
        if !validateFields() {
            
            self.showErrorMessage("Please fill all the fields or select from cards!")
            return false
            
       
            
        } else {
            
            // continue with register
            return true
            
        }
        
    }
    
    func validateFields() -> Bool {
        
        if self.address1.count > 0 && self.city.count > 0 && self.state.count > 0 {
            return true
        }
        
        return false
        
    }
    func showErrorMessage(_ errorMessage: String) {
        self.errorMessage = errorMessage
    }
    
}
