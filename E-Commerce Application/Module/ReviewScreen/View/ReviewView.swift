//
//  ReviewView.swift
//  E-Commerce
//
//  Created by NourAllah Ahmed on 5/29/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//

import SwiftUI

struct ReviewView: View {
    var rate : Int = 2
      @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
            VStack{
                HStack{
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
                          }
                      
                     Spacer().frame(width:90)

                    HeaderView(header: "Review", cartNum: "", image: "star").padding()
                    Spacer()
                }
                Spacer()
                Spacer()
                
                //MARK:- user do not post his rate yet
                HStack{
                    ForEach(0 ..< self.rate) { item in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    ForEach(self.rate ..< 5) { item in
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                        
                    }
                    
                }.padding()

                List{
                    ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                        VStack{
                            HStack{
                                VStack {
                                    Text("USER NAME").padding(.leading)
                                    Text("20/1/2022").font(.caption)
                                    //.padding(.leading)
                                }
                               

                                Spacer()
                                
                                HStack{
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow).padding(.leading)
                                    Text("5").padding()
                                }
                                .padding(.trailing)

                                .background(Color.white.opacity(0.90))
                                .cornerRadius(13)
                            }
                            Text("his review: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ").padding()
                        }.background(Color.gray.opacity(0.29))
                        .cornerRadius(15)
                    }
                }.onAppear{
                    UITableView.appearance().separatorStyle = .none

                }
        }
        
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView()
    }
}

struct HeaderView: View {
    var header : String
    @State var cartNum : String
    var image :String
    var body: some View {
        HStack{
        Text(header)
            .padding()
            .foregroundColor(.blue)
            .font(.title)

        }
    }
}
