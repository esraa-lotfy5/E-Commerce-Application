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
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
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
                
                Button(action: {

                    // navigate to forgot password
                    
                }) {
                    
                    Text("Forgot Password?")
                        .foregroundColor(Color.blue)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 25)
                    
                }
                    
                Button(action: {

                    if self.validateFields() {
                        // continue with login
                    } else {
                        self.showErrorMessage("You need to provide email and password")
                    }
                    
                }) {
                    
                    Text("Login").bold()
                    
                }.padding().frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
                
                Text(self.errorMessage)
                    .foregroundColor(Color.red)
                    .multilineTextAlignment(.center)
                    
            }
            .navigationBarTitle("Login")
            .navigationBarItems(
                trailing:
                    NavigationLink(
                        destination: RegisterScreen(), label: {
                        Text("Register").font(.headline)
                    })
            )
            
        }
        
    }
    
    func validateFields() -> Bool {
        
        if self.email.count > 0 && self.password.count > 0 {
            return true
        }
        
        return false
        
    }
    
    func showErrorMessage(_ errorMessage: String) {
        self.errorMessage = errorMessage
    }
    
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
