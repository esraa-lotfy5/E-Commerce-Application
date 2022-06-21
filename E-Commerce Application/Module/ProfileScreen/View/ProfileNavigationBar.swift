//
//  ProfileNavigationBar.swift
//  E-Commerce Application
//
//  Created by Esraa Lotfy  on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct ProfileNavigationBar: View {
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var presentationMode :Binding<PresentationMode>
    var body: some View {
        VStack{
            HStack {
                HStack{
                    /*
                    HStack (alignment: .top, spacing: 0){
                        //MARK:- back button
                        Spacer().frame(width:10)
                        
                        HStack{
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                        }
                        .onTapGesture {
//                            self.presentationMode.wrappedValue.dismiss()
                            print("Do Nothing now")
                        }
                        .frame(width: 50, height: 40)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                    }
                     */
//                    Spacer()
                }
                Spacer().frame(width: 24.0)
                
                //  ------------- start of header text --------------------------
                Text("Profile")
                    .fontWeight(.bold)
                //  ------------ end of header text --------------------
                Spacer()
                //  --------- start of cart icon -----------------
                Button(action: {
                    print(String("cart button tapped"))
                })
                {
                    HStack {
                        Image(systemName: "cart")
                            .foregroundColor(.black)
                    }
                    .padding(15)
                    .frame(width: 50, height: 40)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                }
                //  --------- end of cart icon -----------------
                Spacer().frame(width:8)
                //  --------- start of fav icon -----------------
                Button(action: {
                    print(String("settings button tapped"))
                })
                {
                    HStack {
                        Image("gearshape")
                            .foregroundColor(.black)
                    }
                    .padding(15)
                    .frame(width: 50, height: 40)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                }
                //  --------- end of fav icon -----------------
               Spacer().frame(width: 24.0)
        }.padding(.bottom, 16)
           .padding(.top, 16)
        }
    }
}

//struct ProfileNavigationBar_Previews: PreviewProvider {
//      @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    static var previews: some View {
////        ProfileNavigationBar(presentationMode: self.pr)
//    }
//}
