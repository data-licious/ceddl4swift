//
//  PrivacyTest.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 23/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import XCTest
@testable import ceddl4swift

class PrivacyTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testPrivacy() {

        let digitalDataPrivacy = DigitalData.create()
            .privacy()
            .addDefaultAccessCategory()
            .domains(["nonexistent-store.com", "audit.com"])
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

        do {
            let digitalDataDictionary = digitalDataPrivacy.getMap()
            if let json = try TestUtililty.loadJSONFromFile(type(of: self), name: "privacyTest") as? Dictionary<String, AnyObject> {
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
