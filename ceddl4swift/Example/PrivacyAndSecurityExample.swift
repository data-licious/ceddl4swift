//
//  PrivacyAndSecurityExample.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 23/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

/// Generates the privacy and security example from the CEDDL specification on
/// page 12 and 13.

public class PrivacyAndSecurityExample {

    public func privacySecurity() {

        do {

            // Consider the following example, of an e-commerce company, www.nonexistent-store.com,
            // which uses tools from the vendors calc.com, adsRus.com, and audit.com.
            // To use the data standard, first they will categorize their technology vendors into categories:
            // - Default: nonexistent-store.com, audit.com
            // - Analytics: calc.com
            // - Recommendations: adsRus.com

            // digitalData.privacy.accessCategories.categories[1] = {
            //                                        categoryName: "Default",
            //                                        domains: [
            //                                          "nonexistent-store.com", 
            //                                          "audit.com"
            //                                        ]
            // }
            // digitalData.privacy.accessCategories.categories[2] = {
            //                                        categoryName: "Analytics",
            //                                        domains: [
            //                                          "calc.com"
            //                                        ]
            // }
            // digitalData.privacy.accessCategories.categories[3] = {
            //                                        categoryName: "Recommendations",
            //                                        domains: [
            //                                          "adsRus.com"
            //                                        ]
            // }


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
            if let json = try Utility.loadJSONFromFile(type(of: self), name: "privacyandsecurity-example") as? Dictionary<String, AnyObject> {
                assert(airlineDigitalDataDict == json, "Digital Data is not equal to contents of file")
            } else {
                assert(false, "Unable to generate dictionary from file")
            }
        } catch let error {
            print(error)
        }
    }
}
