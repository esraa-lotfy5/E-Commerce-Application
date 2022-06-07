//
//  Register.swift
//  E-Commerce Application
//
//  Created by Abdelrhman Ahmed on 31/05/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI
import Alamofire

struct RegisterScreen: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var errorMessage: String = ""
    @State private var hidePassword: Bool = true
    @State private var hideConfirmPassword: Bool = true
    @State private var proceedWithRegister: Bool = false
    @State private var showProgressView: Bool = false
    
    @ObservedObject var registerViewModel = RegisterViewModel()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
                Spacer()
                Text("Register").bold().padding(.top)
                Spacer()
                Spacer()
                
            }.frame(height:200)
            
            
            VStack {
                
                VStack {
                    TextField("First Name", text: self.$firstName)
                        .padding()
                        .padding(.bottom, -25)
                        .foregroundColor(Color.blue)
                    
                    Divider().padding()
                }
                
                
                
                VStack {
                    TextField("Last Name", text: self.$lastName)
                        .padding()
                        .padding(.bottom, -25)
                        .foregroundColor(Color.blue)
                    
                    Divider().padding()
                }
                
                
                
                VStack {
                    TextField("Email", text: self.$email)
                        .padding()
                        .padding(.bottom, -25)
                        .foregroundColor(Color.blue)
                    
                    Divider().padding()
                }
                
                VStack {
                    TextField("Phone", text: self.$phone)
                        .padding()
                        .padding(.bottom, -25)
                        .foregroundColor(Color.blue)
                    
                    Divider().padding()
                }
                
                VStack {
                    
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
                    
                    HStack {
                        
                        Group {
                            
                            if hideConfirmPassword {
                                
                                VStack {
                                    
                                    SecureField("Confirm Password", text: self.$confirmPassword)
                                        .padding()
                                        .padding(.bottom, -15)
                                        .foregroundColor(Color.blue)
                                    
                                    Divider().padding().padding(.top, -15)
                                    
                                }
                                
                            } else {
                                
                                VStack {
                                    
                                    TextField("Confirm Password", text: self.$confirmPassword)
                                        .padding()
                                        .padding(.bottom, -15)
                                        .foregroundColor(Color.blue)
                                    
                                    Divider().padding().padding(.top, -15)
                                    
                                }
                                
                            }
                            
                        }
                        
                        Button(action: {
                            self.hideConfirmPassword.toggle()
                        }) {
                            Image(systemName: self.hideConfirmPassword ? "eye.slash" : "eye")
                                .padding()
                                .padding(.top, -15)
                                .accentColor(.gray)
                        }
                    }
                    
                }
                
                NavigationLink(destination: HomeScreen(), isActive: $proceedWithRegister) {
                    EmptyView()
                }
                
                
                Button(action: {
                    
                    if self.validateRegister() {
                        // continue with register
                        registerUser()
                    }
                    
                }) {
                    
                    if showProgressView {
                        
                        if #available(iOS 14.0, *) {
                            ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white))
                        }
                        
                    } else {
                        Text("Register").bold()
                    }
                    
                }.padding().frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
                
                Text(self.errorMessage)
                    .foregroundColor(Color.red)
                    .multilineTextAlignment(.center)
                
            }
            
            Spacer().frame(height: 100)
            
        }
    }
    
    func validateRegister() -> Bool {
        
        if !validateFields() {
            
            self.showErrorMessage("Please fill all the fields!")
            return false
            
        } else if !validatePassword() {
            
            self.showErrorMessage("Password and confirm password doesn't match!")
            return false
            
        } else {
            
            // continue with register
            return true
            
        }
        
    }
    
    func validateFields() -> Bool {
        
        if self.firstName.count > 0 && self.lastName.count > 0 && self.email.count > 0 && self.phone.count > 0 && self.password.count > 0 && self.confirmPassword.count > 0 {
            return true
        }
        
        return false
        
    }
    
    func validatePassword() -> Bool {
        
        if self.password != self.confirmPassword {
            
            return false
        }
        
        return true
        
    }
    
    func showErrorMessage(_ errorMessage: String) {
        self.errorMessage = errorMessage
    }
    
    func registerUser() {
        
        // +15132546015
        showProgressView = true
        
        let customer: Parameters = [ "customer": [
            "first_name": firstName,
            "last_name": lastName,
            "email": email,
            "phone": phone,
            "tags": password
        ]
        ]
        
        registerViewModel.registerCustomer(customer: customer) { result in
            
            switch result {
            
            case .success(let customer):
                print("customer id in register screen: \(customer?.id)")
                proceedWithRegister = true
                showProgressView = false
                
            case .failure(let error):
                showErrorMessage(error.localizedDescription)
                showProgressView = false
            }
            
        }
        
    }
    
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
