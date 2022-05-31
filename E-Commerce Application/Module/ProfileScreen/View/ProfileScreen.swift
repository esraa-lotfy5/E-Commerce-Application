//
//  ProfileScreen.swift
//  E-Commerce Application
//
//  Created by Esraa Lotfy  on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct ProfileScreen: View {
    var userloggedIn : Bool
    var userName : String = "Esraa"
    
    var body: some View {
        ScrollView{
            VStack{
                ProfileNavigationBar()
                if(userloggedIn){
                    //  --------- start of user name row -----------------
                    HStack{
                        Spacer()
                        Text("Hello \(userName),")
                            .font(.system(size: 20.0))
                        Spacer()
                    }.padding(.bottom, 16)
                    //  --------- end of user name row -------------------
                    //  --------- start of user orders -------------------
                    ProfileOrders()
                    //  --------- end of user orders ---------------------
                    //  --------- start of user wishlist -----------------
                    ProfileWishlist()
                    //  --------- end of user wishlist -------------------
                } else{
                    //  user not logged in
                    Spacer().frame(height: 100)
                    Text("You are not logged in, please ")
                        .font(.system(size: 24))
                        .padding(.bottom, 10)
                    HStack{
                        Spacer()
                        Text("Login")
                            .font(.system(size: 24))
                            .foregroundColor(.blue)
                            .padding(.trailing, 8)
                            .onTapGesture {
                                // Login
                            }
                        Text("or")
                            .foregroundColor(.black)
                            .font(.system(size: 22))
                            .padding(.trailing, 8)
                        Text("Register")
                            .font(.system(size: 24))
                            .foregroundColor(.blue)
                            .onTapGesture {
                                // Register
                            }
                        Spacer()
                    }
                }
            }
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen(userloggedIn: false)
    }
}
