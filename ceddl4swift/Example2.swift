//
//  Example2.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 23/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Example2 {

    public func exampleFromSpec2() {

        let example2DigitalData = DigitalData.create("ProductDetailPageNikonCamera-Staging")
            .page().pageInfo().pageID("Nikon Camera")
            .destinationURL("http://mysite.com/products/NikonCamera.html")
            .endPageInfo()
            .addPrimaryCategory("Cameras")
            .addCategory("subCategory1", value: "Nikon" as AnyObject)
            .addCategory("pageType", value: "ProductDetail" as AnyObject)
            .addAttribute("Seasonal", value: "Christmas" as AnyObject)
            .endPage()
            .addProduct()
            .productInfo()
            .productName("Nikon SLR Camera")
            .sku("sku12345")
            .manufacturer("Nikon")
            .endProductInfo()
            .addPrimaryCategory("Cameras")
            .addAttribute("productType", value: "Special Offer" as AnyObject)
            .endProduct()

        do {
            let example2DigitalDataDict = example2DigitalData.getMap()
            if let json = try TestUtililty.loadJSONFromFile(type(of: self), name: "example2") as? Dictionary<String, AnyObject> {
                assert(example2DigitalDataDict == json, "Digital Data is not equal to contents of file")
            } else {
                assert(false, "Unable to generate dictionary from file")
            }
        } catch let error {
            print(error)
        }
    }
}
