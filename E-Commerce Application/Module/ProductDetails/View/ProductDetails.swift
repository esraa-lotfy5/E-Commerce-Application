//
//  ProductDetails.swift
//  E-Commerce Application
//
//  Created by Abdelrhman Ahmed on 31/05/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct ProductDetails: View {
    
    var product: Product
    @State var productCount = 1
    @State private var showingAlert = false
    
    let colorGray = Color(red: 232/255, green: 232/255, blue: 232/255)
    let colorWhite = Color(red: 1, green: 1, blue: 1)
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>   
    var productSizes = "OS"
    var productColors = "black"
    
    var body: some View {
        
//        NavigationView {
            
            ScrollView {
                
                VStack {
                    
                    //                    ProductDetailsImage(image: Image(product.image?.src ?? ""))
                    
                    
                    //                    PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
//                                                            .aspectRatio(3 / 2, contentMode: .fit)
                    
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
                            Text("Details").bold().padding(15)
                            Spacer()
                            Spacer()
                        }
                        Spacer()
                    }
//                    Spacer().frame(width:50)
                    
                    PageView(pages: [FeatureCard(image: Image("bag1")), FeatureCard(image: Image("bag2")), FeatureCard(image: Image("bag3")), FeatureCard(image: Image("bag4"))])
//                        .scaledToFit()
                        .aspectRatio(3 / 2, contentMode: .fit)
                    
                    
                    VStack(alignment: .leading) {
                        
                        HStack {
                            Text(product.title ?? "").bold()
                            Spacer()
                            Text("$\(product.variants?[0].price ?? "")").foregroundColor(.blue)
                        }
                        
                        VStack(alignment: .center){
                            
                            Text(product.body_html ?? "")
                                .font(.subheadline)
                                .foregroundColor(.secondary).padding(.top, 5).padding(.bottom, 5)
                                .frame(
                                    minWidth: 0,
                                    maxWidth: .infinity,
                                    minHeight: 0,
                                    maxHeight: .infinity,
                                    alignment: .topLeading
                                )
                        }
                        
                        HStack {
                                                
                            NavigationLink(destination: ReviewView()){
                             
                                    Image(systemName: "star.fill").resizable().frame(width: 25, height: 25).foregroundColor(Color.yellow)
                                    
                                    Text("4.9").bold().foregroundColor(.black)
                                    
                                    
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                if self.productCount > 1 {
                                    self.productCount -= 1
                                }
                                
                            }) {
                                Image(systemName: "minus.square.fill")
                                    .resizable()
                                    .foregroundColor(.blue)
                                    .frame(width: 25, height: 25)
                            }
                            
                            Text("\(self.productCount)").bold()
                            
                            Button(action: {
                                self.productCount += 1
                            }) {
                                Image(systemName: "plus.square.fill")
                                    .resizable()
                                    .foregroundColor(.blue)
                                    .frame(width: 25, height: 25)
                            }
                        }
                        
                        Button(action: {
                            
                            self.showingAlert.toggle()
                          
                            
                        }) {
                            
                            Image(systemName: "cart")
                            Text("Add to cart").bold()
                            
                        }.padding()
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .alert(isPresented: self.$showingAlert) {
                                Alert(
                                    title: Text("Item add"),
                                    message: Text("\(String(describing: product.title ?? "")) was successfully added to cart")
                                )
                                
                            }
                        
                        Text("Details").bold()
                        
                        ProductDetailsContent(title: "Vendor", details: product.vendor ?? "N/A", backgroundColor: colorGray)
                        
                        ProductDetailsContent(title: "Type", details: product.product_type ?? "N/A", backgroundColor: colorWhite).padding(.top, -8)
                        
                        ProductDetailsContent(title: "Sizes", details: productSizes ?? "N/A", backgroundColor: colorGray).padding(.top, -8)
                        
                        
                        ProductDetailsContent(title: "Colors", details: productColors ?? "N/A", backgroundColor: colorWhite).padding(.top, -8)
                        
                    }.padding()
                    
                }
                
            }.navigationBarBackButtonHidden(true)
//            .navigationBarTitle(Text("Details"), displayMode: .inline)
//            .navigationBarTitle("Details")
//            .navigationBarTitleDisplayMode(.inline)
//        }
    
    }
}

struct ProductDetails_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ProductDetails(product:
                        
                        Product(id: 6870135275659, title: "ADIDAS | CLASSIC BACKPACK", body_html: "This women's backpack has a glam look, thanks to a faux-leather build with an allover fur print. The front zip pocket keeps small things within reach, while an interior divider reins in potential chaos.", vendor: "ADIDAS", product_type: "ACCESSORIES", created_at: "2022-05-24T16:37:47+02:00", handle: "adidas-classic-backpack", updated_at: "2022-05-24T16:46:10+02:00", published_at: "2022-05-24T16:37:47+02:00", status: "active", published_scope: "web", tags: "adidas, backpack, egnition-sample-data", admin_graphql_api_id: "gid://shopify/Product/6870135275659", variants:
                                    
                                    [Variant(product_id: 6870135275659, id: 40335555395723, title: "OS / black", price: "70.00", sku: "AD-03-black-OS", position: 1, inventory_policy: "deny", fulfillment_service: "manual", inventory_management: "shopify", option1: "OS", option2: "black", created_at: "2022-05-24T16:37:47+02:00", updated_at: "2022-05-24T16:38:50+02:00", taxable: true, grams: 0, weight: 0, weight_unit: "kg", inventory_item_id: 42434113142923, inventory_quantity: 5, old_inventory_quantity: 5, requires_shipping: true, admin_graphql_api_id: "gid://shopify/ProductVariant/40335555395723")], options:
                                    
                                    [Option(product_id: 6870135275659, id: 8846250672267, name: "Size", position: 1, values: ["OS"]), Option(product_id: 6870135275659, id: 8846250705035, name: "Color", position: 2, values: ["black"])], images: [
                                        
                                        ProductImage(product_id: 6870135275659, id: 29882743390347, position: 1, created_at: "2022-05-24T16:37:47+02:00", updated_at: "2022-05-24T16:37:47+02:00", width: 635, height: 560, src: "https://cdn.shopify.com//s//files//1//0589//7509//2875//products//85cc58608bf138a50036bcfe86a3a362.jpg?v=1653403067", admin_graphql_api_id: "gid://shopify/ProductImage/29882743390347"),
                                        
                                        ProductImage(product_id: 6870135275659, id: 29882743390347, position: 2, created_at: "2022-05-24T16:37:47+02:00", updated_at: "2022-05-24T16:37:47+02:00", width: 635, height: 560, src: "https://cdn.shopify.com//s//files//1//0589//7509//2875//products//8a029d2035bfb80e473361dfc08449be.jpg?v=1653403067", admin_graphql_api_id: "gid://shopify/ProductImage/29882743390347"),
                                        
                                        ProductImage(product_id: 6870135275659, id: 29882743390347, position: 3, created_at: "2022-05-24T16:37:47+02:00", updated_at: "2022-05-24T16:37:47+02:00", width: 635, height: 560, src: "https://cdn.shopify.com//s//files//1//0589//7509//2875//products//ad50775123e20f3d1af2bd07046b777d.jpg?v=1653403067", admin_graphql_api_id: "gid://shopify/ProductImage/29882743390347")
                                        
                                    ], image: ProductImage(product_id: 6870135275659, id: 29882743390347, position: 1, created_at: "2022-05-24T16:37:47+02:00", updated_at: "2022-05-24T16:37:47+02:00", width: 635, height: 560, src: "sneakers", admin_graphql_api_id: "gid://shopify/ProductImage/29882743390347")
                               )
        )
        
    }
    
}


//        let variants = [Variant(product_id: 6870135275659, id: 40335555395723, title: "OS / black", price: "70.00", sku: "AD-03-black-OS", position: 1, inventory_policy: "deny", fulfillment_service: "manual", inventory_management: "shopify", option1: "OS", option2: "black", created_at: "2022-05-24T16:37:47+02:00", updated_at: "2022-05-24T16:38:50+02:00", taxable: true, grams: 0, weight: 0, weight_unit: "kg", inventory_item_id: 42434113142923, inventory_quantity: 5, old_inventory_quantity: 5, requires_shipping: true, admin_graphql_api_id: "gid://shopify/ProductVariant/40335555395723")]
//
//        let options = [Option(product_id: 6870135275659, id: 8846250672267, name: "Size", position: 1, values: ["OS"]), Option(product_id: 6870135275659, id: 8846250705035, name: "Color", position: 2, values: ["black"])]
//
//        let images = [
//
//            ProductImage(product_id: 6870135275659, id: 29882743390347, position: 1, created_at: "2022-05-24T16:37:47+02:00", updated_at: "2022-05-24T16:37:47+02:00", width: 635, height: 560, src: "https://cdn.shopify.com//s//files//1//0589//7509//2875//products//85cc58608bf138a50036bcfe86a3a362.jpg?v=1653403067", admin_graphql_api_id: "gid://shopify/ProductImage/29882743390347"),
//
//            ProductImage(product_id: 6870135275659, id: 29882743390347, position: 2, created_at: "2022-05-24T16:37:47+02:00", updated_at: "2022-05-24T16:37:47+02:00", width: 635, height: 560, src: "https://cdn.shopify.com//s//files//1//0589//7509//2875//products//8a029d2035bfb80e473361dfc08449be.jpg?v=1653403067", admin_graphql_api_id: "gid://shopify/ProductImage/29882743390347"),
//
//            ProductImage(product_id: 6870135275659, id: 29882743390347, position: 3, created_at: "2022-05-24T16:37:47+02:00", updated_at: "2022-05-24T16:37:47+02:00", width: 635, height: 560, src: "https://cdn.shopify.com//s//files//1//0589//7509//2875//products//ad50775123e20f3d1af2bd07046b777d.jpg?v=1653403067", admin_graphql_api_id: "gid://shopify/ProductImage/29882743390347")
//
//        ]
//
////        let image = ProductImage(product_id: 6870135275659, id: 29882743390347, position: 1, created_at: "2022-05-24T16:37:47+02:00", updated_at: "2022-05-24T16:37:47+02:00", width: 635, height: 560, src: "https://cdn.shopify.com//s//files//1//0589//7509//2875//products//85cc58608bf138a50036bcfe86a3a362.jpg?v=1653403067", admin_graphql_api_id: "gid://shopify/ProductImage/29882743390347")
//
//        let image = ProductImage(product_id: 6870135275659, id: 29882743390347, position: 1, created_at: "2022-05-24T16:37:47+02:00", updated_at: "2022-05-24T16:37:47+02:00", width: 635, height: 560, src: "sneakers", admin_graphql_api_id: "gid://shopify/ProductImage/29882743390347")
//
//        let product = Product(id: 6870135275659, title: "ADIDAS | CLASSIC BACKPACK", body_html: "This women's backpack has a glam look, thanks to a faux-leather build with an allover fur print. The front zip pocket keeps small things within reach, while an interior divider reins in potential chaos.", vendor: "ADIDAS", product_type: "ACCESSORIES", created_at: "2022-05-24T16:37:47+02:00", handle: "adidas-classic-backpack", updated_at: "2022-05-24T16:46:10+02:00", published_at: "2022-05-24T16:37:47+02:00", status: "active", published_scope: "web", tags: "adidas, backpack, egnition-sample-data", admin_graphql_api_id: "gid://shopify/Product/6870135275659", variants: variants, options: options, images: images, image: image)
//
//        ProductDetails(product: product)
