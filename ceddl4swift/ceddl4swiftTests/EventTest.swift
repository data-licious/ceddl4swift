//
//  EventTest.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 23/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import XCTest
@testable import ceddl4swift

class EventTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testEvent() {

        let date = Date(timeIntervalSince1970: 0)

        let digitalDataEvent = (DigitalData.create()
            .addEvent().eventInfo()
            .eventName("Add News Portal")
            .eventAction("addportal")
            .eventPoints(200)
            .type("contentModifier")
            .timeStamp(date)
            .cause("hurricane")
            .effect("include portal 1234")
            .custom("customEventInfo", value: "customValue" as AnyObject) as! EventInfo)
            .endEventInfo()
            .addAttribute("customAttribute", value: "example" as AnyObject)
            .addPrimaryCategory("content events")
            .addCategory("cat2", value: "example" as AnyObject)
            .endEvent()
            .addEvent().eventInfo()
            .eventName("Another event")
            .endEventInfo()
            .endEvent()

        do {
            let digitalDataDictionary = digitalDataEvent.getMap()
            if let json = try TestUtililty.loadJSONFromFile(type(of: self), name: "eventTest") as? Dictionary<String, AnyObject> {
                assert(digitalDataDictionary == json, "Digital Data is not equal to contents of file")
            } else {
                assert(false, "Unable to generate dictionary from file")
            }
        } catch let error {
            print(error)
            assert(false, "Digital Data threw an error")
        }
    }

    func testEvent2() {

        let date = Date(timeIntervalSince1970: 0)

        let digitalDataEvent = (DigitalData.create()
            .addEvent().eventInfo()
            .eventName("Add News Portal")
            .eventAction("addportal")
            .eventPoints(200)
            .type("contentModifier")
            .timeStamp(date)
            .cause("hurricane")
            .effect("include portal 1234")
            .custom("customEventInfo", value: "customValue" as AnyObject) as! EventInfo)
            .endEventInfo()
            .attributes()
            .attribute("customAttribute", value: "example" as AnyObject)
            .endAttributes()
            .category()
            .primaryCategory("content events")
            .category("cat2", value: "example" as AnyObject)
            .endCategory()
            .endEvent()
            .addEvent().eventInfo()
            .eventName("Another event")
            .endEventInfo()
            .endEvent()

        do {
            let digitalDataDictionary = digitalDataEvent.getMap()
            if let json = try TestUtililty.loadJSONFromFile(type(of: self), name: "eventTest") as? Dictionary<String, AnyObject> {
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
