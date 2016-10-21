//
//  UserTest.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 23/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import XCTest
@testable import ceddl4swift

class UserTest: XCTestCase {

    func testUser() {

        let digitalDataUser = ((DigitalData.create()
            .addUser()
            .addSegment("membership", value: "basic membership")
            .addProfile()
            .profileInfo()
            .profileID("humanbeing12345")
            .userName("me")
            .email("me@humanbeing12345.nl")
            .language("nl")
            .returningStatus("new")
            .type("user")
            .custom("test", value: "value" as AnyObject) as! ProfileInfo<UserProfile>)
            .endProfileInfo()
            .address()
            .line1("673 My Street")
            .line2("Apt 1")
            .city("Austin")
            .stateProvince("TX")
            .postalCode("78610")
            .country("USA")
            .custom("extra adress info", value: "ring twice" as AnyObject) as! Address<UserProfile>)
            .endAddress()
            .addSocial("twitter:", value: "somebody")
            .addSocial("facebook", value: "othervalue")
            .addAttribute("example", value: "something")
            .endProfile()
            .endUser()

        do {
            let digitalDataDictionary = digitalDataUser.getMap()
            if let json = try Utility.loadJSONFromFile(type(of: self), name: "userTest") as? Dictionary<String, AnyObject> {
                assert(digitalDataDictionary == json, "Digital Data is not equal to contents of file")
            } else {
                assert(false, "Unable to generate dictionary from file")
            }
        } catch let error {
            print(error)
            assert(false, "Digital Data threw an error")
        }
    }

    func testUser2() {
        let digitalDataUser = ((DigitalData.create()
            .addUser()
            .segment()
            .segment("membership", value: "basic membership" as AnyObject)
            .endSegment()
            .addProfile()
            .profileInfo()
            .profileID("humanbeing12345")
            .userName("me")
            .email("me@humanbeing12345.nl")
            .language("nl")
            .returningStatus("new")
            .type("user")
            .custom("test", value: "value" as AnyObject) as! ProfileInfo<UserProfile>)
            .endProfileInfo()
            .address()
            .line1("673 My Street")
            .line2("Apt 1")
            .city("Austin")
            .stateProvince("TX")
            .postalCode("78610")
            .country("USA")
            .custom("extra adress info", value: "ring twice" as AnyObject) as! Address<UserProfile>)
            .endAddress()
            .social()
            .social("twitter:", value: "somebody" as AnyObject)
            .social("facebook", value: "othervalue" as AnyObject)
            .endSocial()
            .attributes()
            .attribute("example", value: "something" as AnyObject)
            .endAttributes()
            .endProfile()
            .endUser()

        do {
            let digitalDataDictionary = digitalDataUser.getMap()
            if let json = try Utility.loadJSONFromFile(type(of: self), name: "userTest") as? Dictionary<String, AnyObject> {
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
