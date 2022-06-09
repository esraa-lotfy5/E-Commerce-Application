//
//  ProductDetails.swift
//  E-Commerce Application
//
//  Created by Abdelrhman Ahmed on 31/05/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI
import Kingfisher


struct ProductDetails: View {
    @State var isAvailable : Bool = false
    @State var addToCartColor : Color = Color.blue
    @State var productCount = 1
    @State private var showingAlert = false
    @State var productQuantity = 0
    @State var productVariants : [Variant] = []
    @State var varients : [String] = []

    @State   var selectedColor = ""
    @State   var selectedSize = ""
    @State var alertMessage = ""
    @State var alert_Title = ""
    @State var varientID:Int?

    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var productDetailsViewModel : ProductDetailsViewModel = ProductDetailsViewModel()
    
    let colorGray = Color(red: 232/255, green: 232/255, blue: 232/255)
    let colorWhite = Color(red: 1, green: 1, blue: 1)
    var productSizes = "OS"
    var productColors = "black"
    var productid :String =  "6870133932171"// "6870135275659" //
    
    var body: some View {
        
        ScrollView {
            
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
                        Text("Details").bold().padding(15)
                        Spacer()
                        Spacer()
                    }
                    Spacer()
                }
             
                PageView(pages: [
                    
                    FeatureCard(image:
                                    KFImage.url(URL(string:
                                                        productDetailsViewModel.Products?.images?[0].src ?? " "))
                                        .placeholder { Image("default") }
                        .resizable()
                        .onSuccess { r in print("done") }
                        .onFailure { r in print("failure") }
                        .loadImmediately()),
                    
                    FeatureCard(image:  KFImage.url(URL(string:    productDetailsViewModel.Products?.images?[1].src! ?? " "))
                        .placeholder { Image("default") }
                        .resizable()
                        .onSuccess { r in print("done") }
                        .onFailure { r in print("failure") }
                        .loadImmediately()),
                    
                    FeatureCard(image: KFImage.url(URL(string:    productDetailsViewModel.Products?.images?[2].src! ?? " "))
                        .placeholder { Image("default") }
                        .resizable()
                        .onSuccess { r in print("done") }
                        .onFailure { r in print("failure") }
                        .loadImmediately())
                ]).frame( height: 300)
                
                VStack(alignment: .leading) {
                    //#TODO: TITLE AND PRICE
                    HStack {
                        Text(   productDetailsViewModel.Products?.title ??  "").bold() // product.title ??
                        Spacer()
                        Text("$\(productDetailsViewModel.Products?.variants?[0].price ?? "")").foregroundColor(.blue)
                    }
                    
                    
                    //#TODO: quanitity AND status

                    HStack{
                        Text(productQuantity.description + " ")
                            .foregroundColor(Color.blue)
                            .font(Font.headline)
                  
                        Text(productDetailsViewModel.Products?.status ==  "active" ?  "available"  : "not available")
                            .foregroundColor(Color.blue)
                            .font(Font.headline)
                    }
                    
                    
                    //#TODO: HTML BODY

                    VStack(alignment: .center){
                        
                        Spacer()
                        Text(productDetailsViewModel.Products?.body_html ?? "") //product.body_html ??
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
                    
                    //#TODO: REVIEW AND COUNTER

                    VStack{
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
                        
                        
            }
                    
         
                
              
                    
                    
                    //#TODO: add to Cart BUTTON
                    Button(action: {
                        
                        self.showingAlert.toggle()
                        // TODO: check that the user choose size and color
                        if (selectedSize == "" || selectedColor == ""){
                            print("nil")
                            alert_Title = "Warrning"
                            alertMessage = "Please choose size and color !"
                        }
                        
                        else{
                        
                        //#TODO: getting the varient of the product
                        productDetailsViewModel.Products?.variants?.filter({ varient in
                            
                            if varient.option2 == selectedColor && varient.option1 == selectedSize{
                                varientID = varient.id
                                alert_Title = "Adding item"
                                alertMessage = "\(String(describing: productDetailsViewModel.Products?.title ?? "")) was successfully added to cart"
                            }
                            return true
                        })
                        
                     
                        // TODO: check that the user choose size and color
                        guard let productVarientId = varientID else {return}
                        print("test product details \(productVarientId)")
                        productDetailsViewModel.postDraftOrder(variantId: productVarientId, quantity: productCount)
                        
                        }
                    }) {
                        
                        Image(systemName: "cart")
                        Text("Add to cart").bold()
                        
                    }.padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .background(addToCartColor)
                        .cornerRadius(10)
                        .alert(isPresented: self.$showingAlert) {
                            Alert(
                                title: Text(alert_Title), // $alerttitle
                                message: Text(alertMessage)
                            )
                            
                        }
                        .disabled(isAvailable)
                    
                    
                    
                    //TODO: Details
                    
                    Text("Details").bold()
                    
                    ProductDetailsContent(title: "Vendor", details: productDetailsViewModel.Products?.vendor ??  "N/A", backgroundColor: colorGray)
                        .padding(.top, -8)
                    
                    ProductDetailsContent(title: "Type", details:  productDetailsViewModel.Products?.product_type ?? "N/A", backgroundColor: colorWhite)
                        .padding(.top, -8)
                    
                    ProductDetailsContentWithOptions(title: "Sizes", details:  productDetailsViewModel.Products?.options?.first?.values? .map { $0 } ?? ["N/A"], backgroundColor:  colorGray, text: self.$selectedSize)
                        .padding(.top, -8)

                    
                    ProductDetailsContentWithOptions(title: "Colors", details:  productDetailsViewModel.Products?.options?.last?.values?.map { $0 }  ?? ["N/A"], backgroundColor: colorWhite, text: self.$selectedColor)
                        .padding(.top, -8)
                        
                }.padding()
                
            }.onAppear{
                
                self.productDetailsViewModel.getProductDetails(id: self.productid) { (result) in
                    
                    self.varients = self.productDetailsViewModel.Products?.options?.first?.values! ?? ["nil"]
                    
                    
                    //TODO: Product status (available or not) 
                    if productDetailsViewModel.Products?.status ==  "active" {
                        isAvailable =  false
                    }
                    else{
                        isAvailable = true
                        addToCartColor = Color.gray
                    }
                }
                
                //TODO: - product inventory_quantity
                self.productDetailsViewModel.getProductInventoryQuantity(id: self.productid) { (result) in
                    productQuantity = try! result.get()?.count ?? 0

                }
           
                
            }
            
        }.navigationBarBackButtonHidden(true)
 
        
    }
}
