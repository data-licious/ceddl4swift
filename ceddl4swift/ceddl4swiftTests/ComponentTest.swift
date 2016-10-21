//
//  ComponentTest.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 23/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import XCTest
@testable import ceddl4swift

class ComponentTest: XCTestCase {

    func testComponent() {
        let digitalDataComponent = ((DigitalData.create()
            .addComponent()
            .componentInfo()
            .componentID("rog300v")
            .custom("componentName", value: "How to Use Rogaine" as AnyObject) as! ComponentInfo)
            .custom("description", value: "Hair Treatment Video" as AnyObject) as! ComponentInfo)
            .endComponentInfo()
            .addAttribuut("testAttribute", value: "testattr" as AnyObject)
            .attributes()
            .attribute("testAttribute2", value: "testattr2" as AnyObject)
            .endAttributes()
            .addPrimaryCategory("test")
            .addCategory("customcat", value: "testCat" as AnyObject)
            .category()
            .category("customcat2", value: "testCat2" as AnyObject)
            .endCategory()
            .endComponent()
            .addComponent()
            .componentInfo()
            .componentID("rog400v")
            .endComponentInfo()
            .endComponent()
        
        do {
            let digitalDataDictionary = digitalDataComponent.getMap()
            if let json = try Utility.loadJSONFromFile(type(of: self), name: "componentTest") as? Dictionary<String, AnyObject> {
                assert(digitalDataDictionary == json, "Digital Data is not equal to contents of file")
            } else {
                assert(false, "Unable to generate dictionary from file")
            }
        } catch let error {
            print(error)
            assert(false, "Digital Data threw an error")
        }
    }

    func testComponent2() {

        let digitalDataComponent = ((DigitalData.create()
            .addComponent()
            .componentInfo()
            .componentID("rog300v")
            .custom("componentName", value: "How to Use Rogaine" as AnyObject) as! ComponentInfo)
            .custom("description", value: "Hair Treatment Video" as AnyObject) as! ComponentInfo)
            .endComponentInfo()
            .attributes()
            .attribute("testAttribute2", value: "testattr2" as AnyObject)
            .endAttributes()
            .addAttribuut("testAttribute", value: "testattr" as AnyObject)
            .category()
            .category("customcat2", value: "testCat2" as AnyObject)
            .endCategory()
            .addPrimaryCategory("test")
            .addCategory("customcat", value: "testCat" as AnyObject)
            .endComponent()
            .addComponent()
            .componentInfo()
            .componentID("rog400v")
            .endComponentInfo()
            .endComponent();

        do {
            let digitalDataDictionary = digitalDataComponent.getMap()
            if let json = try Utility.loadJSONFromFile(type(of: self), name: "componentTest") as? Dictionary<String, AnyObject> {
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

