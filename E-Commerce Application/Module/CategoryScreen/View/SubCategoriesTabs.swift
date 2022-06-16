//
//  SubCategoriesTabs.swift
//  E-Commerce Application
//
//  Created by Esraa Lotfy  on 12/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct SubCategoriesTabs: View {
    @State var shirtIconTapped = false
    @State var shoesIconTapped = false
    @State var accessoryIconTapped = false
    @State var shirtShadowSize : Int = 0
    @State var shoesShadowSize: Int = 0
    @State var accessoryShadowSize : Int = 0
    @ObservedObject var categoryViewModel : CategoryViewModel
    
    var body: some View {
        HStack{
            Spacer()
            VStack{
                Image("tshirt")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40)
                    .padding(10)
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                    .shadow(color: Color.blue, radius: CGFloat(self.shirtShadowSize), x: 0, y: 0)
                    .onTapGesture {
                        if(shirtIconTapped){
                            self.shirtShadowSize = 0
                            shirtIconTapped = false
                            categoryViewModel.param.updateValue("", forKey: "product_type")
                            categoryViewModel.isProductTypeChanged = ""
                        }else{
                            self.shirtShadowSize = 2
                            shirtIconTapped = true
                            accessoryIconTapped = false
                            shoesIconTapped = false
                            self.shoesShadowSize = 0
                            self.accessoryShadowSize = 0
                            categoryViewModel.param.updateValue("T-SHIRTS", forKey: "product_type")
                            categoryViewModel.isProductTypeChanged = "shirt"
                        }
                    }
                Text("T-Shirt")
                    .font(.headline)
            }
            Spacer().frame(width: 16)
            VStack{
                Image("accessory")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40)
                    .padding(10)
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                    .shadow(color: Color.blue, radius: CGFloat(self.accessoryShadowSize), x: 0, y: 0)
                    .onTapGesture {
                        if(accessoryIconTapped){
                            self.accessoryShadowSize = 0
                            accessoryIconTapped = false
                            categoryViewModel.param.updateValue("", forKey: "product_type")
                            categoryViewModel.isProductTypeChanged = ""
                        }else{
                            self.accessoryShadowSize = 2
                            accessoryIconTapped = true
                            shoesIconTapped = false
                            shirtIconTapped = false
                            self.shoesShadowSize = 0
                            self.shirtShadowSize = 0
                            categoryViewModel.param.updateValue("ACCESSORIES", forKey: "product_type")
                            categoryViewModel.isProductTypeChanged = "Accessory"
                        }
                    }
                Text("accessory")
                    .font(.headline)
            }
            Spacer().frame(width: 16)
            VStack{
                Image("sneakers")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40)
                    .padding(10)
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                    .shadow(color: Color.blue, radius: CGFloat(self.shoesShadowSize), x: 0, y: 0)
                    .onTapGesture {
                        if(shoesIconTapped){
                            self.shoesShadowSize = 0
                            shoesIconTapped = false
                            categoryViewModel.param.updateValue("", forKey: "product_type")
                            categoryViewModel.isProductTypeChanged = ""
                        }else{
                            self.shoesShadowSize = 2
                            shoesIconTapped = true
                            accessoryIconTapped = false
                            shirtIconTapped = false
                            self.shirtShadowSize = 0
                            self.accessoryShadowSize = 0
                            categoryViewModel.param.updateValue("SHOES", forKey: "product_type")
                            categoryViewModel.isProductTypeChanged = "shoes"
                        }
                    }
                Text("Shoes")
                    .font(.headline)
            }
            Spacer()
        }
    }
}

struct SubCategoriesTabs_Previews: PreviewProvider {
    static var previews: some View {
        SubCategoriesTabs(categoryViewModel: CategoryViewModel(brandName: ""))
    }
}
