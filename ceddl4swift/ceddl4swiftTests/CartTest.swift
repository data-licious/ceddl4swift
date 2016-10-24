//
//  CartTest.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 22/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import XCTest
@testable import ceddl4swift

class CartTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCart() {
        let digitalDataCart = ((((DigitalData.create().cart()
            .cartID("test1234"))
            .price()
            .basePrice(200.20)
            .voucherCode("Alpha")
            .voucherDiscount(0.50)
            .currency("EUR")
            .taxRate(0.20)
            .shipping(5.00)
            .shippingMethod("UPS")
            .priceWithTax(120)
            .cartTotal(120)
            .custom("customString", value: "example" as AnyObject) as! Price<Cart>)
            .custom("customDouble", value: 123 as AnyObject) as! Price<Cart>)
            .endPrice()
            .addAttribute("customAttribute", value: "example" as AnyObject)
            .attributes()
            .attribute("customAttribute2", value: "example2" as AnyObject)
            .endAttributes()
            .addItem()
            .productInfo()
            .productID("testproductid")
            .endProductInfo()
            .addPrimaryCategory("testCategory")
            .quantity(10)
            .price()
            .basePrice(20.20)
            .voucherCode("AlphaProduct")
            .voucherDiscount(0.55)
            .currency("USD")
            .taxRate(0.30)
            .shipping(6.00)
            .shippingMethod("None")
            .priceWithTax(300)
            .endPrice()
            .addLinkedProduct()
            .productInfo()
            .productID("linkedProd1")
            .endProductInfo()
            .endLinkedProduct()
            .addLinkedProduct()
            .productInfo()
            .productID("linkedProd2")
            .endProductInfo()
            .endLinkedProduct()
            .addAttribuut("test1", value: "test2" as AnyObject)
            .endItem()
            .addItem()
            .category()
            .category("examplecategory", value: "test" as AnyObject)
            .endCategory()
            .attributes()
            .attribute("exampleattribute", value: "value" as AnyObject)
            .endAttributes()
            .endItem()
            .endCart())
        do {
            let digitalDataDictionary = digitalDataCart.getMap()
            if let json = try TestUtililty.loadJSONFromFile(type(of: self), name: "cartTest") as? Dictionary<String, AnyObject> {
                assert(digitalDataDictionary == json, "Digital Data is not equal to contents of file")
            } else {
                assert(false, "Unable to generate dictionary from file")
            }
        } catch let error {
            print(error)
            assert(false, "Digital Data threw an error")
        }
    }
}





