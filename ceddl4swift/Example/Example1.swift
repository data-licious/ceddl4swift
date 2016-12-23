//
//  Example1.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 23/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

/// Generates the following example from the CEDDL specification on page 9.
///
///      digitalData={
///        pageInstanceID: "MyHomePage-Production",
///        page: {
///          pageInfo: {
///            pageID: "Home Page",
///            destinationURL: "http://mysite.com/index.html"
///          }
///        },
///        category: {
///          primaryCategory: "FAQ Pages",
///          subCategory1: "ProductInfo",
///          pageType: "FAQ"
///        },
///        attributes: {
///          country: "US",
///          language: "en-US"
///        }
///      }

public class Example1 {

    public func exampleFromSpec1() {

        let example1DigitalData = DigitalData.create("MyHomePage-Production")
            .page().pageInfo()
            .pageID("Home Page")
            .destinationURL("http://mysite.com/index.html")
            .endPageInfo()
            .addPrimaryCategory("FAQ Pages")
            .addCategory("subCategory1", value: "ProductInfo" as AnyObject)
            .addCategory("pageType", value: "FAQ" as AnyObject)
            .addAttribute("country", value: "US" as AnyObject)
            .addAttribute("language", value: "en-US" as AnyObject)
            .endPage()

        do {
            let example1DigitalDataDict = example1DigitalData.getMap()
            if let json = try Utility.loadJSONFromFile(self.dynamicType, name: "example1") as? Dictionary<String, AnyObject> {
                assert(example1DigitalDataDict == json, "Digital Data is not equal to contents of file")
            } else {
                assert(false, "Unable to generate dictionary from file")
            }
        } catch let error {
            print(error)
        }
    }
}
