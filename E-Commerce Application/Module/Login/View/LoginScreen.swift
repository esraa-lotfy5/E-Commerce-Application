//
//  Login.swift
//  E-Commerce Application
//
//  Created by Abdelrhman Ahmed on 31/05/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct LoginScreen: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var errorMessage: String = ""
    @State private var hidePassword: Bool = true
    
    @ObservedObject private var loginViewModel = LoginViewModel()
    @State private var proceedWithLogin: Bool = false
    @State private var showProgressView: Bool = false
    @State private var isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    
    init(){
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Spacer()
                Text("Login")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
                
                TextField("Email", text: self.$email)
                    .padding()
                    .padding(.bottom, -25)
                    .foregroundColor(Color.blue)
                
                Divider().padding()
                
                HStack {
                    
                    Group {
                        
                        if hidePassword {
                            
                            VStack {
                                
                                SecureField("Password", text: self.$password)
                                    .padding()
                                    .padding(.bottom, -15)
                                    .foregroundColor(Color.blue)
                                
                                Divider().padding().padding(.top, -15)
                                
                            }
                            
                        } else {
                            
                            VStack {
                                
                                TextField("Password", text: self.$password)
                                    .padding()
                                    .padding(.bottom, -15)
                                    .foregroundColor(Color.blue)
                                
                                Divider().padding().padding(.top, -15)
                                
                            }
                            
                        }
                    }

                    Button(action: {
                        self.hidePassword.toggle()
                    }) {
                        Image(systemName: self.hidePassword ? "eye.slash" : "eye")
                            .padding()
                            .padding(.top, -15)
                            .accentColor(.gray)
                    }
                }
                
//                Button(action: {
//
//                    // navigate to forgot password
//
//                }) {
//
//                    Text("Forgot Password?")
//                        .foregroundColor(Color.blue)
//                        .frame(maxWidth: .infinity, alignment: .trailing)
//                        .padding(.trailing, 25)
//
//                }
//
//                NavigationLink(destination: TabBarHome()
//                    .navigationBarBackButtonHidden(true)
//
////                    .navigationViewStyle(StackNavigationViewStyle())
////                    .navigationBarHidden(true)
//                ){
//
//                    Text("Login")
//                        .bold()
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .foregroundColor(Color.white)
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                        .padding()
//                }
                
                NavigationLink(destination: OrderList().navigationBarBackButtonHidden(true), isActive: $proceedWithLogin) {
                    EmptyView()
                }
                
                
                Button(action: {
                    
                    if self.validateFields() {
                        // continue with register
                        loginCustomer(email: email, password: password)
                    }
                    
                }) {
                    
                    if showProgressView {
                        
                        if #available(iOS 14.0, *) {
                            ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white))
                        }
                        
                    } else {
                        Text("Login")
                            .bold()
                            
                    }
                    
                }.padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
                
                
                NavigationLink(destination: RegisterScreen()
                    .navigationBarBackButtonHidden(true)
                               //                    .navigationViewStyle(StackNavigationViewStyle())
                               //                    .navigationBarHidden(true)
                ){
                    
                    Text("Create an Account")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                    
                    
                }

                Spacer()

                    
//                Button(action: {
//
//                    if self.validateFields() {
//                        // continue with login
//                    } else {
//                        self.showErrorMessage("You need to provide email and password")
//                    }
//
//                }) {
//
//                    Text("Login").bold()
//
//                }.padding().frame(maxWidth: .infinity)
//                    .foregroundColor(Color.white)
//                    .background(Color.blue)
//                    .cornerRadius(10)
//                    .padding()
                
                Text(self.errorMessage)
                    .foregroundColor(Color.red)
                    .multilineTextAlignment(.center)
                    
            }
//            .navigationBarTitle("Login")
                .navigationBarHidden(true)
                .navigationBarTitle("Login" , displayMode: .inline)
                
//                .navigationViewStyle(StackNavigationViewStyle())
//                .navigationBarItems(
//                    trailing:
//                        NavigationLink(
//                            destination: RegisterScreen(), label: {
//                            Text("Register").font(.headline)
//                        }))

            
        }
        
    }
    
    func validateFields() -> Bool {
        
        if self.email.count > 0 && self.password.count > 0 {
            return true
        }
        
        showErrorMessage("Please fill all the fields!")
        return false
        
    }
    
    func showErrorMessage(_ errorMessage: String) {
        self.errorMessage = errorMessage
    }
    
    func loginCustomer(email: String, password: String) {
        
        showProgressView = true
        
        loginViewModel.loginCustomer() { result in
            
            switch result {
            
            case .success(let customersResponse):
                print("login screen customer: \(customersResponse)")
                
                let authenticatedCustomer = customersResponse?.customers.filter {
                    $0.email?.lowercased() == email.lowercased() && $0.tags == password
                }
                
                print("login customer: \(authenticatedCustomer)")
                
                guard let customer = authenticatedCustomer else {
                    
                    showErrorMessage("Authentication Failed!")
                    showProgressView = false
                    return
                    
                }
                
                if customer.count > 0 {
                    print("logged in successfully \(customer)")
                    
                    UserDefaults.standard.set(self.email, forKey: "email")
                    UserDefaults.standard.set(customer[0].first_name, forKey: "first_name")
                    UserDefaults.standard.set(customer[0].last_name, forKey: "last_name")
                    UserDefaults.standard.set(true, forKey: "isLoggedIn")
                    
                    showProgressView = false
                    proceedWithLogin = true
                    
                    
                    
                } else {
                    showErrorMessage("Authentication Failed!")
                    showProgressView = false
                }
                
                
            case .failure(let error):
                print("login screen error: \(error.localizedDescription)")
                showProgressView = false
                showErrorMessage(error.localizedDescription)
            }
            
        }
        
    }
    
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
