//
//  Register.swift
//  E-Commerce Application
//
//  Created by Abdelrhman Ahmed on 31/05/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct RegisterScreen: View {
    
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var errorMessage: String = ""
    @State private var hidePassword: Bool = true
    @State private var hideConfirmPassword: Bool = true
     @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
                    
            VStack {
//                VStack {
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
//                }
                TextField("Username", text: self.$username)
                    .padding()
                    .padding(.bottom, -25)
                    .foregroundColor(Color.blue)
                
                Divider().padding()
                
                
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
                    
                Button(action: {

                    if self.validateFields() {
                        // continue with register
                    } else {
                        self.showErrorMessage("Please fill all the fields")
                    }
                    
                }) {
                    
                    Text("Register").bold()
                    
                }.padding().frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
                
                Text(self.errorMessage)
                    .foregroundColor(Color.red)
                    .multilineTextAlignment(.center)
                Spacer().frame(height: 300)

            
//            .navigationBarTitle("Register")
        }
    }
    
    func validateFields() -> Bool {
        
        if self.username.count > 0 && self.email.count > 0 && self.password.count > 0 && self.confirmPassword.count > 0 {
            return true
        }
        
        return false
        
    }
    
    func showErrorMessage(_ errorMessage: String) {
        self.errorMessage = errorMessage
    }
    
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
