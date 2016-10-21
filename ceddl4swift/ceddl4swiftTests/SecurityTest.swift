//
//  SecurityTest.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 23/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import XCTest
@testable import ceddl4swift

class SecurityTest: XCTestCase {

    func testSecurity() {

        do {
            let digitalDataSecurity = try ((((((DigitalData.create()
                .pageInstanceId("ProductDetailPageNikonCamera-Staging")
                .page()
                .pageInfo()
                .pageID("ProductDetailPageNikonCamera")
                .defaultSecurity() as! PageInfo)
                .pageName("Nikon SLR Camera")
                .security(["Analytics", "Personalization"]) as! PageInfo)
                .destinationURL("http://www,testshop.nl/nikon/")
                .security(["Analytics"]) as! PageInfo)
                .custom("custom pageinfo", value: "example" as AnyObject) as! PageInfo)
                .defaultSecurity() as! PageInfo)
                .endPageInfo()
                .attributes()
                .attribute("test", value: "example" as AnyObject)
                .security(["Analytics", "Personalization"]) as! DAttributes<Page>)
                .endAttributes()
                .endPage()

            let digitalDataDictionary = digitalDataSecurity.getMap()
            if let json = try Utility.loadJSONFromFile(type(of: self), name: "securityTest") as? Dictionary<String, AnyObject> {
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
