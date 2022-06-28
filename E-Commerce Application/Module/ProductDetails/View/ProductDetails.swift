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
    @State var refresh = true
    @State var inventory_item_id : Int?
    //trial favorite
    @State var varientIDFav:Int = 0
    var inventory_quantity : Int {
        var result  = 0
        for i in productDetailsViewModel.Products?.variants ?? []{
            
            if i.option2 == selectedColor && i.option1 == selectedSize{
                result =  i.inventory_quantity ?? 0
            }
           
            
        }
        return result
    }
    @State var heartChecked : Bool = false
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()

    
    @State private var IsEgp : Bool?

    @State private var Egp = UserDefaults.standard.float(forKey: "EGP")
    @State private var usd = UserDefaults.standard.float(forKey: "USD")
    @State var currencyString = UserDefaults.standard.string(forKey: "options")
    @State private var isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var productDetailsViewModel : ProductDetailsViewModel = ProductDetailsViewModel()
    
    let colorGray = Color(red: 232/255, green: 232/255, blue: 232/255)
    let colorWhite = Color(red: 1, green: 1, blue: 1)
   
    var productid :String? //  "6870135275659" //"6870133932171"//
    
   
    init(productId: String){
        print(productId)
        self.productid = productId
        self.productDetailsViewModel.getProductDetails(id: String(self.productid ?? "")) { re in
            print(  try? re.get()?.product)
        }
        print("OKAY")
    }
    var body: some View {
        if productDetailsViewModel.NetworkState == true {
        ScrollView {
            
            if #available(iOS 15.0, *) {
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
                            
                            //trial to set icon for favorite
                            HStack{
                                Image(systemName: productDetailsViewModel.getFavorites(variantIDFav: productDetailsViewModel.Products?.variants?[0].id ?? -100) ? "heart.fill" : "heart")
                                    .foregroundColor(.red)
                                    .onAppear()
                                    .onReceive(timer) { _ in
                                        
                                    }
                            }
                            .onTapGesture {
//                                print("\n  favorite button is clicked  \n")
//                                print(" \n variant id == \( productDetailsViewModel.Products?.variants?[0].id) \n")
                                
                                if isLoggedIn {
                                if productDetailsViewModel.getFavorites(variantIDFav: productDetailsViewModel.Products?.variants?[0].id ?? 0) {  // item is liked -- > turn to unlike DELETE
                                    DispatchQueue.main.async {
                                        let productIdFav = productDetailsViewModel.favoriteItem?.id
                                        print("PRODUCTID === \(String(describing: productIdFav))")
                                        productDetailsViewModel.deleteFavorite(draftFavoriteID: productIdFav ?? 0)
                                        productDetailsViewModel.favoriteHere = false
                                    }
                                    
                                }else{ //item is unliked ---> turn to like POST
                                    DispatchQueue.main.async {
                                        let variantIdFav = productDetailsViewModel.Products?.variants?[0].id ?? 0
                                        productDetailsViewModel.postFavorite(variantIDFav: variantIdFav )
                                        productDetailsViewModel.favoriteHere = true
                                        print("\n posted \n")
                                    }
                                }
                                }
                                else{
                                    self.showingAlert.toggle()
                                 
                                        alert_Title = "Warrning"
                                        alertMessage = "Please sign in to add to WishList "
                                    
                                }
                                
                            }.frame(width: 50, height: 40)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                                .onAppear()
                            
                            
                            
                            
                            
                        }
                        Spacer()
                    }
                    

                    
                    //MARK: Images
                  
                        PageView(pages: [
                            
                            FeatureCard(image:    productDetailsViewModel.Products?.images?[0].src! ?? ""),
                            
                            
                            FeatureCard(image:    productDetailsViewModel.Products?.images?[1].src! ?? "")
                            ,
                            
                            FeatureCard(image:    productDetailsViewModel.Products?.images?[2].src! ?? "") ,
                          
                        ]).frame( height: 300)
                        
                
                    VStack(alignment: .leading) {
                        //MARK: TITLE AND PRICE
                        HStack {
                            Text(   productDetailsViewModel.Products?.title ??  "").bold() // product.title ??
                            Spacer()
                            
                            if IsEgp ?? true {
                                Text("\((Float(productDetailsViewModel.Products?.variants?[0].price ?? "0.0") ?? 0.0)  , specifier: "%.2f")  EGP ").foregroundColor(.blue)
                            }
                            else{
                                Text("\((Float(productDetailsViewModel.Products?.variants?[0].price ?? "0.0") ?? 0.0)  / Egp , specifier: "%.2f")  USD ").foregroundColor(.blue)
                                
                                
                            }
                            
                         
                        }
                        
                        
                        //MARK: quanitity AND status
                        HStack{
                            
                            if inventory_quantity != 0 {
                            Text("\(inventory_quantity)")
                                .foregroundColor(Color.blue)
                                .font(Font.headline)
                         
                            Text(productDetailsViewModel.Products?.status ==  "active" ?  "available"  : "not available")
                                .foregroundColor(Color.blue)
                                .font(Font.headline)
                            }
                            }
                        
                        //MARK: HTML BODY
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
                        
                        //MARK: REVIEW AND COUNTER
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
                        
                        
                        
                        
                        
                        
                        //MARK: add to Cart BUTTON
                        Button(action: {
                            if isLoggedIn{
                                self.showingAlert.toggle()
                                // TODO: check that the user choose size and color
                                if (selectedSize == "" || selectedColor == ""){
                                    print("nil")
                                    alert_Title = "Warrning"
                                    alertMessage = "Please choose size and color !"
                                }
                            
                            else{
                                if inventory_quantity < 0 || inventory_quantity < productCount {
                                    self.showingAlert.toggle()
                                    showingAlert = true
                                    alert_Title = "Warrning"
                                    alertMessage = "Out of stock!!"
                                }
                                else{
                                    
                                //MARK: getting the varient of the product
                                productDetailsViewModel.Products?.variants?.filter({ varient in
                                    
                                    if varient.option2 == selectedColor && varient.option1 == selectedSize{
                                        varientID = varient.id
                                        inventory_item_id = varient.inventory_item_id ?? 0
//                                        inventory_quantity = varient.inventory_quantity ?? 0
                                        alert_Title = "Adding item"
                                        alertMessage = "\(String(describing: productDetailsViewModel.Products?.title ?? "")) was successfully added to cart"
                                    }
                                    return true
                                })
                                
                                
                                //MARK: check that the user choose size and color
                                guard let productVarientId = varientID else {return}
                                print("test product details \(productVarientId)")
                                productDetailsViewModel.postDraftOrder(variantId: productVarientId, quantity: productCount , selectedSize : selectedSize, inventory_item_id: inventory_item_id ?? 0 )
                                
                                }
                                
                            }
                                
                            }else{
                                self.showingAlert.toggle()
                             
                                    alert_Title = "Warrning"
                                    alertMessage = "Please sign in to add to Shopping Cart "
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
                        
                        
                        
                        //MARK: Details
                        
                        Text("Details").bold()
                        VStack{
                        ProductDetailsContent(title: "Vendor", details: productDetailsViewModel.Products?.vendor ??  "N/A", backgroundColor: colorGray)
                            .padding(.top, -8)
                        
                        ProductDetailsContent(title: "Type", details:  productDetailsViewModel.Products?.product_type ?? "N/A", backgroundColor: colorWhite)
                            .padding(.top, -8)
//                        if productDetailsViewModel.Products?.options?.count ?? 0 == 2 {
                        
                            
                        ProductDetailsContentWithOptions(title: "Sizes", details:  productDetailsViewModel.Products?.options?.first?.values? .map { $0 } ?? ["N/A"], backgroundColor:  colorGray, text: self.$selectedSize)
                            .padding(.top, -8)

                        ProductDetailsContentWithOptions(title: "Colors", details:  productDetailsViewModel.Products?.options?.last?.values?.map { $0 }  ?? ["N/A"], backgroundColor: colorWhite, text: self.$selectedColor)
                                .padding(.top, -8)
                            
                        }
                        
                    }.padding()
                    
                }.refreshable {
                    
                    while true{
                    
                    await productDetailsViewModel.refreshPage(id: self.productid!)
                    print("refresh")
                    }
                    
                }
                
                .onAppear{
                    
                    self.productDetailsViewModel.getProductDetails(id: self.productid ?? "0") { (result) in
                        
                        self.varients = self.productDetailsViewModel.Products?.options?.first?.values! ?? ["nil"]
                        
                        
                        //MARK: Product status (available or not)
                        if productDetailsViewModel.Products?.status ==  "active" {
                            isAvailable =  false
                        }
                        else{
                            isAvailable = true
                            addToCartColor = Color.gray
                        }
                        
                        

                        self.IsEgp = UserDefaults.standard.bool(forKey: "isEGP")

                    }
                    
                    //TODO: - product inventory_quantity
                    self.productDetailsViewModel.getProductInventoryQuantity(id: self.productid ?? "0") { (result) in
                        productQuantity = try! result.get()?.count ?? 0
                        
                    }
                    
                    
                }
            } else {
                // Fallback on earlier versions
            }
            
        }.navigationBarBackButtonHidden(true)
                .onAppear{
                    self.IsEgp = UserDefaults.standard.bool(forKey: "isEGP")
                }
        }
        else{
            NoNetworkView()
        }
 
        
    }
}
extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}
