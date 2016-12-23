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
            if let json = try Utility.loadJSONFromFile(self.dynamicType, name: "privacyTest") as? Dictionary<String, AnyObject> {
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
