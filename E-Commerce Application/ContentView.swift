//
//  ContentView.swift
//  E-Commerce Application
//
//  Created by Esraa Lotfy  on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let add =  [FakeAddress(id: 1, name: "My home #1", address: "438 Dark Suprt Avenune ", city: " San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),FakeAddress(id: 2, name: "My home #2", address: "438 Dark Suprt Avenune ", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),FakeAddress(id: 3, name: "My home #3", address: "438 Dark Suprt Avenune ", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),FakeAddress(id: 4, name: "My home #4", address: "438 Dark Suprt Avenune ", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),FakeAddress(id: 5, name: "My home #4", address: "438 Dark Suprt Avenune ", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),FakeAddress(id: 6, name: "My home #5", address: "438 Dark Suprt Avenune , San Francisco ,CA, 94528", city: "San Francisco ,CA, 94528", zipCode: 112, state: "state", defultShippingAddress: false),FakeAddress(id: 7, name: "My home #6", address: "438 Dark Suprt Avenune , San Francisco ,CA, 94528", city: "city", zipCode: 112, state: "state", defultShippingAddress: false)]
    var body: some View {
//        Text("Hello World")
        
//PaymentScreen(addressess: add)
//        ProductDetails(product:
//
//            Product(id: 6870135275659, title: "ADIDAS | CLASSIC BACKPACK", body_html: "This women's backpack has a glam look, thanks to a faux-leather build with an allover fur print. The front zip pocket keeps small things within reach, while an interior divider reins in potential chaos.", vendor: "ADIDAS", product_type: "ACCESSORIES", created_at: "2022-05-24T16:37:47+02:00", handle: "adidas-classic-backpack", updated_at: "2022-05-24T16:46:10+02:00", published_at: "2022-05-24T16:37:47+02:00", status: "active", published_scope: "web", tags: "adidas, backpack, egnition-sample-data", admin_graphql_api_id: "gid://shopify/Product/6870135275659", variants:
//
//                [Variant(product_id: 6870135275659, id: 40335555395723, title: "OS / black", price: "70.00", sku: "AD-03-black-OS", position: 1, inventory_policy: "deny", fulfillment_service: "manual", inventory_management: "shopify", option1: "OS", option2: "black", created_at: "2022-05-24T16:37:47+02:00", updated_at: "2022-05-24T16:38:50+02:00", taxable: true, grams: 0, weight: 0, weight_unit: "kg", inventory_item_id: 42434113142923, inventory_quantity: 5, old_inventory_quantity: 5, requires_shipping: true, admin_graphql_api_id: "gid://shopify/ProductVariant/40335555395723")], options:
//
//                [Option(product_id: 6870135275659, id: 8846250672267, name: "Size", position: 1, values: ["OS"]), Option(product_id: 6870135275659, id: 8846250705035, name: "Color", position: 2, values: ["black"])], images: [
//
//                    ProductImage(product_id: 6870135275659, id: 29882743390347, position: 1, created_at: "2022-05-24T16:37:47+02:00", updated_at: "2022-05-24T16:37:47+02:00", width: 635, height: 560, src: "https://cdn.shopify.com//s//files//1//0589//7509//2875//products//85cc58608bf138a50036bcfe86a3a362.jpg?v=1653403067", admin_graphql_api_id: "gid://shopify/ProductImage/29882743390347"),
//
//                    ProductImage(product_id: 6870135275659, id: 29882743390347, position: 2, created_at: "2022-05-24T16:37:47+02:00", updated_at: "2022-05-24T16:37:47+02:00", width: 635, height: 560, src: "https://cdn.shopify.com//s//files//1//0589//7509//2875//products//8a029d2035bfb80e473361dfc08449be.jpg?v=1653403067", admin_graphql_api_id: "gid://shopify/ProductImage/29882743390347"),
//
//                    ProductImage(product_id: 6870135275659, id: 29882743390347, position: 3, created_at: "2022-05-24T16:37:47+02:00", updated_at: "2022-05-24T16:37:47+02:00", width: 635, height: 560, src: "https://cdn.shopify.com//s//files//1//0589//7509//2875//products//ad50775123e20f3d1af2bd07046b777d.jpg?v=1653403067", admin_graphql_api_id: "gid://shopify/ProductImage/29882743390347")
//
//                ], image: ProductImage(product_id: 6870135275659, id: 29882743390347, position: 1, created_at: "2022-05-24T16:37:47+02:00", updated_at: "2022-05-24T16:37:47+02:00", width: 635, height: 560, src: "sneakers", admin_graphql_api_id: "gid://shopify/ProductImage/29882743390347")
//            )
//        )
//        OrderListView(product: [Product2(name: "test", price: 20.0, size: "S", desc: "desc")])
//        CategoryScreen()
//        HomeScreen()
        LoginScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
