//
//  ReviewView.swift
//  E-Commerce
//
//  Created by NourAllah Ahmed on 5/29/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//

import SwiftUI

struct ReviewView: View {
    var rate : Int = 4
    var reviews = GenerateReview().generateReview()
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
                    Spacer()
                    Text("Reviews  ").bold()
                    Spacer()
                    HeaderView(header: "", cartNum: "", image: "star").padding()
                    Spacer()
                }
//                Spacer()
//                Spacer()
//
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
                }.padding(.bottom)

                List{
                    ForEach(reviews , id: \.self) { item in
                        VStack{
                            HStack{
                                VStack {
                                    Text(item.userName!).padding(.leading)
                                    Text("\( Int.random(in: 1...30))/\( Int.random(in: 1...12))/2022").font(.caption)
                                    .padding(.leading)
                                }
                               

                                Spacer()
                                
                                HStack{
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                    Text(item.reviewRate!)
                                }
                                .padding()
                                .background(Color.gray.opacity(0.19))
                                .cornerRadius(10)
                            }
                            Text(item.reviewBody!)
                                .lineLimit(4)
                                .padding()
                        }.background(Color.white.opacity(0.29))
                        .cornerRadius(15)
                    }
                }
        }.navigationBarBackButtonHidden(true)
        
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
