//
//  OrderRow.swift
//  E-Commerce
//
//  Created by NourAllah Ahmed on 5/29/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//
import SwiftUI
import Kingfisher
struct OrderRow: View {
    @State var product : DraftOrder
//    @ObservedObject var shoppingCartViewModel : ShoppingCartViewModel = ShoppingCartViewModel()
    @State var checked = false
    
    var body: some View {
        HStack{
            //MARK: Image
            
            //First
            ProductImage3(imageName: product.noteAttributes?.first?.value ?? "default")
            VStack{
                //Second
                ProductRowDetails(product: product)
//                Stepper.init("", onIncrement: {
//                    shoppingCartViewModel.updateDraftOrder(variantId: (product.lineItems?.first?.variantId)!, quantity: ((product.lineItems?.first?.quantity)!) + 1, draftOrderID: product.id!)
//
//
//                }, onDecrement: {
//                    if((product.lineItems?.first?.quantity)! - 1) == 0{
//                        //TODO: delete
//                        shoppingCartViewModel.deleteDraftOrder(draftOrderID: product.id!)
//                    }
//                    else{
//                        //TODO: update
//
//                    shoppingCartViewModel.updateDraftOrder(variantId: (product.lineItems?.first?.variantId)!, quantity: (product.lineItems?.first?.quantity)! - 1, draftOrderID: product.id!)
//                    }
//
//                })
                
                
            }//VSTACK
        }
//        .background(Color.white)
//        .cornerRadius(10)
//        .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
        
    //HSTACK
}
}

//MARK:- >>>>>>>> Product Image <<<<<<<<<<<<
struct ProductImage3: View {
    var imageName :String
    var body: some View {
        
        KFImage.url(URL(string:   imageName))
            .placeholder { Image("default") }
            .resizable()
            .onSuccess { r in print("done") }
            .onFailure { r in print("failure") }
            .loadImmediately()
            .border(Color.gray)
            .cornerRadius(15)
            .frame(width: 100, height: 150)
                    .padding()
            
    }
}
/*
 //Third
                HStack {
                    Spacer()
                    Button(action: {
                        if(self.checked == true) { self.checked = false}
                        else { self.checked = true }
                    }){
                        HStack{
                            if checked == true {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(Color.red)
                                    .padding(.all)
                            } else {
                                Image(systemName: "heart")
                                    .padding(.all)
                            }
                            
                        }
                        
                    }
                }//HSTACK
 */
