//
//  DiscountCodeListView.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 17/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct DiscountCodeListView: View {
    
    @ObservedObject  var viewModelDiscount = DiscountCodeViewModel()
    
    var body: some View {
        List{
        
            ForEach(viewModelDiscount.priceArr, id: \.self) { row in

////                Section{
//
//                        HStack{
//                            HStack{
//                                Text("\(row.value )")
//                                    .font(.title)
//                                    .fontWeight(.bold)
//                                    //.frame(maxHeight: .infinity, alignment: .leading)
//                                    .frame(alignment: .trailing)
//                                    .padding()
//                            }.frame(alignment: .leading)
//
//
//                            HStack{
//                                Text("\(row.title )")
//                                .font(.title)
//                                .fontWeight(.bold)
//                                .frame(alignment: .trailing)
//                                .padding()
//                            }.frame(alignment: .trailing)
//                            Spacer()
//                            Spacer()
//                                //.frame(maxHeight: .infinity, alignment: .bottomTrailing)
////                                .padding(.bottom,50)
////                                .padding(.trailing,20)
//                        }.background(Image("DiscountCode").resizable().frame(width: 400, height: 200,alignment: .center))
//                    //.cornerRadius(10)
//                    .deleteDisabled(true)
//                    .padding()
//
//                //Spacer()

                Section{
                    HStack{
                        
                        VStack{
                            Text("\(row.value)")
                                .font(.body)
                                .fontWeight(.semibold)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .center)
                        }.background(Image("DiscountCode").resizable().frame(width: 100, height: 100))

                        Text("Code : \(row.title)")
                            .font(.body)
                            .fontWeight(.semibold)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)

                    }
                .background(Color.white)
                .cornerRadius(10)
                .deleteDisabled(false)
                .padding()
                }
               



            }
            
            

        
    }

                   .navigationBarBackButtonHidden(true)
    }
}


