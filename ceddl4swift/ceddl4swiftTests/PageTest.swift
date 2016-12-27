//
//  PageTest.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 23/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import XCTest
@testable import ceddl4swift

class PageTest: XCTestCase {

    func testPage() {

        let date = NSDate(timeIntervalSince1970: 0)

        let digitalDataPage = DigitalData.create()
            .pageInstanceId("ProductDetailPageNikonCamera-Staging")
            .page()
            .pageInfo()
            .pageID("ProductDetailPageNikonCamera")
            .pageName("Nikon SLR Camera")
            .destinationURL("http://www,testshop.nl/nikon/")
            .referringURL("http://www,testshop.nl/home/")
            .sysEnv("staging")
            .variant("Variant A")
            .version("78")
            .breadCrumbs(["camera", "Nikon", "SLR"])
            .author("S. Veenstra")
            .issueDate(date)
            .effectiveDate(date)
            .expiryDate(date)
            .language("nl")
            .geoRegion("The Netherlands")
            .industryCodes("test")
            .publisher("me")
            .onsiteSearchTerm("search terms")
            .onsiteSearchResults(42)
            .custom("custom pageinfo", value: "example" as AnyObject)
            .endPageInfo()
            .addPrimaryCategory("Cameras")
            .addCategory("subCategory1", value: "Nikon" as AnyObject)
            .addAttribute("Seasonal", value: "Christmas" as AnyObject)
            .addAttribute( "customdateattribute", value: date as AnyObject)
            .attributes()
            .attribute("customnumberattribute", value: 100 as AnyObject)
            .endAttributes()
            .category()
            .category("test", value: "testvalue" as AnyObject)
            .endCategory()
            .endPage()
            .version()

        do {
            let digitalDataDictionary = digitalDataPage.getMap()
            if let json = try Utility.loadJSONFromFile(self.dynamicType, name: "pageTest") as? Dictionary<String, AnyObject> {
                assert(digitalDataDictionary == json, "Digital Data is not equal to contents of file")
            } else {
                assert(false, "Unable to generate dictionary from file")
            }
        } catch let error {
            print(error)
            assert(false, "Digital Data threw an error")
        }
    }

    func testPage2() {

        let date = NSDate(timeIntervalSince1970: 0)

        let digitalDataPage = DigitalData.create()
            .pageInstanceId("ProductDetailPageNikonCamera-Staging")
            .page()
            .pageInfo()
            .pageID("ProductDetailPageNikonCamera")
            .pageName("Nikon SLR Camera")
            .destinationURL("http://www,testshop.nl/nikon/")
            .referringURL("http://www,testshop.nl/home/")
            .sysEnv("staging")
            .variant("Variant A")
            .version("78")
            .breadCrumbs(["camera", "Nikon", "SLR"])
            .author("S. Veenstra")
            .issueDate("1970-01-01T00:00:00Z")
            .effectiveDate("1970-01-01T00:00:00Z")
            .expiryDate("1970-01-01T00:00:00Z")
            .language("nl")
            .geoRegion("The Netherlands")
            .industryCodes("test")
            .publisher("me")
            .onsiteSearchTerm("search terms")
            .onsiteSearchResults(42)
            .custom("custom pageinfo", value: "example" as AnyObject)
            .endPageInfo()
            .addPrimaryCategory("Cameras")
            .addCategory("subCategory1", value: "Nikon" as AnyObject)
            .addAttribute("Seasonal", value: "Christmas" as AnyObject)
            .addAttribute("customdateattribute", value: date as AnyObject)
            .attributes()
            .attribute("customnumberattribute", value: 100 as AnyObject)
            .endAttributes()
            .category()
            .category("test", value: "testvalue" as AnyObject)
            .endCategory()
            .endPage()
            .version()

        do {
            let digitalDataDictionary = digitalDataPage.getMap()
            if let json = try Utility.loadJSONFromFile(self.dynamicType, name: "pageTest") as? Dictionary<String, AnyObject> {
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
