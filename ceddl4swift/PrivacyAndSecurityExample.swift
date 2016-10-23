//
//  PrivacyAndSecurityExample.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 23/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class PrivacyAndSecurityExample {

    public func privacySecurity() {

        do {
        let privacySecurityDigitalData = try (((DigitalData.create()
            .privacy()
            .addDefaultAccessCategory().domains(["nonexistent-store.com", "audit.com"])
            .endAccessCategory()
            .addAccessCategory()
            .categoryName("Analytics")
            .domains(["calc.com"])
            .endAccessCategory()
            .addAccessCategory()
            .categoryName("Recommendations")
            .domains(["adsRus.com"])
            .endAccessCategory()
            .endPrivacy()
            .cart()
            .addItem()
            .productInfo()
            .productName("Example product name")
            .security(["Analytics"]) as! ProductInfo<Item<Cart>>)
            .description("Example description")
            .security(["Analytics"]) as! ProductInfo<Item<Cart>>)
            .productURL("http://www.exampleproducturl.com")
            .security(["Analytics"]) as! ProductInfo<Item<Cart>>)
            .endProductInfo()
            .endItem()
            .endCart()

            let airlineDigitalDataDict = privacySecurityDigitalData.getMap()
            if let json = try TestUtililty.loadJSONFromFile(type(of: self), name: "privacyandsecurity-example") as? Dictionary<String, AnyObject> {
                assert(airlineDigitalDataDict == json, "Digital Data is not equal to contents of file")
            } else {
                assert(false, "Unable to generate dictionary from file")
            }
        } catch let error {
            print(error)
        }
    }
}
