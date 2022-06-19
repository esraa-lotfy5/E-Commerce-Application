//
//  MockNetworkManager.swift
//  E-Commerce ApplicationTests
//
//  Created by NourAllah Ahmed on 19/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
@testable import E_Commerce_Application

class MockNetworkManager{
    var shouldReturnError : Bool
    init (shouldReturnError : Bool){
        self.shouldReturnError = shouldReturnError
    }
    
    let mockProductDetailsJSONResponse = #"""
             {
                 "product": {
                     "id": 6870135275659,
                     "title": "ADIDAS | CLASSIC BACKPACK",
                     "body_html": "This women's backpack has a glam look, thanks to a faux-leather build with an allover fur print. The front zip pocket keeps small things within reach, while an interior divider reins in potential chaos.",
                     "vendor": "ADIDAS",
                     "product_type": "ACCESSORIES",
                     "created_at": "2022-05-24T16:37:47+02:00",
                     "handle": "adidas-classic-backpack",
                     "updated_at": "2022-06-19T01:15:40+02:00",
                     "published_at": "2022-05-24T16:37:47+02:00",
                     "template_suffix": null,
                     "status": "active",
                     "published_scope": "web",
                     "tags": "adidas, backpack, egnition-sample-data",
                     "admin_graphql_api_id": "gid://shopify/Product/6870135275659",
                     "variants": [
                         {
                             "id": 40335555395723,
                             "product_id": 6870135275659,
                             "title": "OS / black",
                             "price": "70.00",
                             "sku": "AD-03-black-OS",
                             "position": 1,
                             "inventory_policy": "deny",
                             "compare_at_price": null,
                             "fulfillment_service": "manual",
                             "inventory_management": "shopify",
                             "option1": "OS",
                             "option2": "black",
                             "option3": null,
                             "created_at": "2022-05-24T16:37:47+02:00",
                             "updated_at": "2022-06-18T16:46:27+02:00",
                             "taxable": true,
                             "barcode": null,
                             "grams": 0,
                             "image_id": null,
                             "weight": 0.0,
                             "weight_unit": "kg",
                             "inventory_item_id": 42434113142923,
                             "inventory_quantity": 42,
                             "old_inventory_quantity": 42,
                             "requires_shipping": true,
                             "admin_graphql_api_id": "gid://shopify/ProductVariant/40335555395723"
                         }
                     ],
                     "options": [
                         {
                             "id": 8846250672267,
                             "product_id": 6870135275659,
                             "name": "Size",
                             "position": 1,
                             "values": [
                                 "OS"
                             ]
                         },
                         {
                             "id": 8846250705035,
                             "product_id": 6870135275659,
                             "name": "Color",
                             "position": 2,
                             "values": [
                                 "black"
                             ]
                         }
                     ],
                     "images": [
                         {
                             "id": 29882743390347,
                             "product_id": 6870135275659,
                             "position": 1,
                             "created_at": "2022-05-24T16:37:47+02:00",
                             "updated_at": "2022-05-24T16:37:47+02:00",
                             "alt": null,
                             "width": 635,
                             "height": 560,
                             "src": "https://cdn.shopify.com/s/files/1/0589/7509/2875/products/85cc58608bf138a50036bcfe86a3a362.jpg?v=1653403067",
                             "variant_ids": [],
                             "admin_graphql_api_id": "gid://shopify/ProductImage/29882743390347"
                         },
                         {
                             "id": 29882743423115,
                             "product_id": 6870135275659,
                             "position": 2,
                             "created_at": "2022-05-24T16:37:47+02:00",
                             "updated_at": "2022-05-24T16:37:47+02:00",
                             "alt": null,
                             "width": 635,
                             "height": 560,
                             "src": "https://cdn.shopify.com/s/files/1/0589/7509/2875/products/8a029d2035bfb80e473361dfc08449be.jpg?v=1653403067",
                             "variant_ids": [],
                             "admin_graphql_api_id": "gid://shopify/ProductImage/29882743423115"
                         },
                         {
                             "id": 29882743455883,
                             "product_id": 6870135275659,
                             "position": 3,
                             "created_at": "2022-05-24T16:37:47+02:00",
                             "updated_at": "2022-05-24T16:37:47+02:00",
                             "alt": null,
                             "width": 635,
                             "height": 560,
                             "src": "https://cdn.shopify.com/s/files/1/0589/7509/2875/products/ad50775123e20f3d1af2bd07046b777d.jpg?v=1653403067",
                             "variant_ids": [],
                             "admin_graphql_api_id": "gid://shopify/ProductImage/29882743455883"
                         }
                     ],
                     "image": {
                         "id": 29882743390347,
                         "product_id": 6870135275659,
                         "position": 1,
                         "created_at": "2022-05-24T16:37:47+02:00",
                         "updated_at": "2022-05-24T16:37:47+02:00",
                         "alt": null,
                         "width": 635,
                         "height": 560,
                         "src": "https://cdn.shopify.com/s/files/1/0589/7509/2875/products/85cc58608bf138a50036bcfe86a3a362.jpg?v=1653403067",
                         "variant_ids": [],
                         "admin_graphql_api_id": "gid://shopify/ProductImage/29882743390347"
                     }
                 }
             }
           """#
    
    
    
    enum ResponseWithError{
        case responseError
    }
    
    
}

extension MockNetworkManager {
    
    
    func getProductDetails(complitionHandler: @escaping (Any?, Error?) -> Void) {
        do{
            let json = Data(mockProductDetailsJSONResponse.utf8)
            let result = try JSONDecoder().decode(ProductsResults.self, from: json)
            if(shouldReturnError){
                complitionHandler(nil, ResponseWithError.responseError as? Error)
            }else{
                complitionHandler(result, nil)
            }
        }catch{
            print("Error occured in casting response to ProductDetails")
        }
    }
}

