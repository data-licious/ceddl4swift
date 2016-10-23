//
//  HealthCareInsuranceExample.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 23/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class HealthCareInsuranceExample {

    public func healthcareInsuranceExample() {

        let member: CustomObject = (((((((CustomObject()
            .custom("memberID", value: "2723 49202388 01" as AnyObject) as! CustomObject)
            .custom("age", value: "41" as AnyObject) as! CustomObject)
            .custom("groupRelationship", value: "436378" as AnyObject) as! CustomObject)
            .custom("groupName", value: "Employer, Inc." as AnyObject) as! CustomObject)
            .custom("relation", value: "Spouse" as AnyObject) as! CustomObject)
            .custom("gender", value: "M" as AnyObject) as! CustomObject)
            .custom("originalJoinDate", value: "2011-01-21" as AnyObject) as! CustomObject)
            .custom("postalCode", value: "15214" as AnyObject) as! CustomObject

        let creationDate = getCreationDate()
        let completeDate = completionDate()

        let application: CustomObject = ((((CustomObject()
            .custom("appID", value: "7565-2373-0086-8937" as AnyObject) as! CustomObject)
            .custom("source", value: "Telephone" as AnyObject) as! CustomObject)
            .custom("status", value: "Pending" as AnyObject) as! CustomObject)
            .custom("creationDate", value: creationDate as AnyObject) as! CustomObject)
            .custom("completionDate", value: completeDate as AnyObject) as! CustomObject

        let effectiveDate = completionDate()

        let plan: CustomObject = ((((CustomObject()
            .custom("name", value: "Family Advantage 250" as AnyObject) as! CustomObject)
            .custom("type", value: "EPO" as AnyObject) as! CustomObject)
            .custom("policyStatus", value: "Current" as AnyObject) as! CustomObject)
            .custom("premium", value: 454.25 as AnyObject) as! CustomObject)
            .custom("effectiveDate", value: effectiveDate as AnyObject) as! CustomObject

        let healthCareDigitalData = HealthCareDigitalData()
            .addMember(member)
            .setApplication(application)
            .setPlan(plan)
        _ = healthCareDigitalData.pageInstanceId("MyHomePage-Production")

        do {
            let healthCareDigitalData = healthCareDigitalData.getMap()
            if let json = try TestUtililty.loadJSONFromFile(type(of: self), name: "healthcare-example") as? Dictionary<String, AnyObject> {
                assert(healthCareDigitalData == json, "Digital Data is not equal to contents of file")
            } else {
                assert(false, "Unable to generate dictionary from file")
            }
        } catch let error {
            print(error)
        }
    }

    private func completionDate() -> Date {
        let calendar = Calendar(identifier: .gregorian)
        var dateComponents = DateComponents()
        dateComponents.year = 2013
        dateComponents.month = 11
        dateComponents.day = 15
        dateComponents.hour = 16
        dateComponents.minute = 05
        dateComponents.second = 16
        return calendar.date(from: dateComponents)!
    }

    private func getCreationDate() -> Date {
        let calendar = Calendar(identifier: .gregorian)
        var dateComponents = DateComponents()
        dateComponents.year = 2013
        dateComponents.month = 11
        dateComponents.day = 15
        dateComponents.hour = 14
        dateComponents.minute = 20
        dateComponents.second = 02
        return calendar.date(from: dateComponents)!
    }
}
