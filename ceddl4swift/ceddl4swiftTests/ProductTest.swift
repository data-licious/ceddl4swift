//
//  ProductTest.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 23/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import XCTest
@testable import ceddl4swift

class ProductTest: XCTestCase {

    func testProduct() {

        let digitalDataProduct = ((DigitalData.create().addProduct().productInfo()
            .productID("rog3000")
            .productName("Rogaine")
            .description("Hair Regrowth")
            .productURL("http://site.com/r.html")
            .productImage("http://site.com/rog300_large.png")
            .productThumbnail("http://site.com/rog300_large.png")
            .manufacturer("Pharma")
            .size("300ml")
            .sku("sku123")
            .color("blue")
            .custom("customprop1", value: "example1" as AnyObject) as! ProductInfo<Product>)
            .endProductInfo().addLinkedProduct()
            .productInfo()
            .description("test")
            .endProductInfo()
            .endLinkedProduct()
            .endProduct()
            .addProduct().productInfo()
            .productID("rog4000")
            .custom("customprop1", value: "example2" as AnyObject) as! ProductInfo<Product>)
            .endProductInfo()
            .addPrimaryCategory("Hair")
            .category()
            .category("testcategory", value: "testvalue" as AnyObject)
            .endCategory()
            .addCategory("anothertestcategory", value: "anothertestvalue" as AnyObject)
            .addAttribute("testattribute", value: "testvalue" as AnyObject)
            .attributes()
            .attribute("anothertestattribute", value: "anothertestvalue" as AnyObject)
            .endAttributes()
            .endProduct()

        do {
            let digitalDataDictionary = digitalDataProduct.getMap()
            if let json = try Utility.loadJSONFromFile(self.dynamicType, name: "productTest") as? Dictionary<String, AnyObject> {
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
