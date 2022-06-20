//
//  E_Commerce_ApplicationTests.swift
//  E-Commerce ApplicationTests
//
//  Created by Esraa Lotfy  on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//

import XCTest
@testable import E_Commerce_Application

class E_Commerce_ApplicationTests: XCTestCase {
    var networkAPI = NetworkAPI()
    var shoppingCartProducts = [DraftOrder]()


    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
   
    func testProductDetails(){
        networkAPI.getProductDetails(id: "6870135275659") { result in
            
            guard let Product = (result as? ProductsResults)?.product else{
                return
            }
            
            XCTAssertEqual(Product.id , 6870135275659 )
            XCTAssertEqual(Product.title , "ADIDAS | CLASSIC BACKPACK" )
            XCTAssertEqual(Product.vendor , "ADIDAS" )

        }
    }
    
    func testPostDraftOrder(){
        let parameters =     [
            "draft_order": [
                "email" : "nourallahahmed1100@gamil.com",  //TODO: get the current users email
                "note" : "cart",
                "note_attributes": [
                    ["name": "image","value": "default"],
                    ["name": "size","value" : "OS"]
                        
                        ]
                
                ,
                "line_items": [[
                    "variant_id": 40335555395723,
                    "quantity":  1
                ]]
            ]
        ]
        networkAPI.postDraftOrder(parameter: parameters)
    }
    
    func testGetAllDraftOrder(){
            networkAPI.getAllDraftOrders { [weak self] result in
              try? result.get()?.draftOrders.filter({ DraftOrder in
                    if(DraftOrder.email == "iosteam@gmail.com" && DraftOrder.note == "cart")
                    {
                        self?.shoppingCartProducts.append(DraftOrder)
                    }
                   
                   return true
               })
        }
        
        XCTAssertEqual(shoppingCartProducts.count, 1 )
           
    }
    
    func testProductQuantity(){
        networkAPI.getProductInventoryQuantity(id: "6870135275659") { result in
            guard let ProductCount = (result as? ProductInventoryQuantity)?.count else{
                return
            }
            
            XCTAssertEqual(ProductCount , 1 )
           
        }
    }
}
