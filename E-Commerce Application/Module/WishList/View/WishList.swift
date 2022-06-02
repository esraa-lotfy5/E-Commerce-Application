//
//  WishList.swift
//  TrySwiftUI
//
//  Created by NourAllah Ahmed on 5/30/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//

import SwiftUI
struct Product3 : Hashable , Identifiable {
    var id  = UUID()
    var name : String?
    var price : Double?
    var size: String?
    var desc: String?
    
}


struct WishList: View {
    @State var product : [Product3]
    @State var cartCount : Int = 0
    @State var totalPrice : Int = 0
    @State var productPrice  : Double = 0.0
    @State var checked = false
 @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
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
                        Spacer()
                        Text("WishList  ").bold()
                        Spacer()
                      }
                      Spacer()
                  }
            if product.count != 0 {
                Section{
                                HStack{
                                 HeaderWishListView(header: "", cartNum: "\(self.$cartCount.wrappedValue)", image: "heart")

                               Spacer()
                                Text("\(self.$cartCount.wrappedValue)")
                                    .foregroundColor(.blue)

                                Image(systemName: "heart" )
                                .foregroundColor(.blue)
                                .padding(.trailing)
                                .padding(.top)
                                .padding(.bottom)
                                }
                                }
                List {
                    ForEach(product , id: \.self) { item in
                        VStack{
                            WishListRow(product: item, productPrice: self.$productPrice).opacity(0.9)
                        }
                        
                    }.onDelete(perform: delete)
                }.onAppear {
                    self.totalPrice = Int(self.product.reduce(0.0){$0 + $1.price!})
                    self.$cartCount.wrappedValue = self.product.count
                    UITableView.appearance().separatorStyle = .none
                    
                }
       
                }
            else {
                emptyWishList()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func delete(with indexSet: IndexSet) {
        indexSet.forEach {
            product.remove(at: $0)
        }
        self.$cartCount.wrappedValue = self.product.count
        print($cartCount.wrappedValue)

    }
    
}


struct WishList_Previews: PreviewProvider {
    static var previews: some View {
        WishList(product: [])
    }
}

struct HeaderWishListView: View {
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
