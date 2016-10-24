//
//  HealthCareInsuranceExample.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 23/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

/// Generates the healthcare inurance example from the CEDDL specification on
/// page 31. This example extends CEDDL with 3 new Object (Member, Application and
/// Plan).
///
/// We create a new class HealthcareDigitalData which extends DigitalData.
/// HealthcareDigitalData adds Objects for (Member, Application and Plan) based on CustomObject.
///


public class HealthCareInsuranceExample {

    public func healthcareInsuranceExample() {

        //	As another example, to collect data in the healthcare insurance industry, it might be more
        //	convenient to model a few entirely new objects to capture relevant information.
        //	One such bespoke object could be digitalData.member, used to capture a member’ s
        //	account details with the institution, which may frequently be insurance related. This could
        //	include sub-objects as detailed below:
        //
        //	Example Member object
        //	digitalData.member[n] = {
        //			memberID: "2723 49202388 01",
        //			age: "41",
        //		 	groupRelationship: "436378",
        //			groupName: "Employer\, Inc.",
        //			relation: "Spouse",
        //			gender: "M",
        //			originalJoinDate: "2011-01-21",
        //			postalCode: "15214"
        //	};

        let member: CustomObject = (((((((CustomObject()
            .custom("memberID", value: "2723 49202388 01" as AnyObject) as! CustomObject)
            .custom("age", value: "41" as AnyObject) as! CustomObject)
            .custom("groupRelationship", value: "436378" as AnyObject) as! CustomObject)
            .custom("groupName", value: "Employer, Inc." as AnyObject) as! CustomObject)
            .custom("relation", value: "Spouse" as AnyObject) as! CustomObject)
            .custom("gender", value: "M" as AnyObject) as! CustomObject)
            .custom("originalJoinDate", value: "2011-01-21" as AnyObject) as! CustomObject)
            .custom("postalCode", value: "15214" as AnyObject) as! CustomObject

        //	Other useful objects may include an Application object and a Plan object, with additional subobjects
        //	under each.
        //	Example Application object
        //
        //	digitalData.application = {
        //		appID: "7565-2373-0086-8937",
        //		source: "Telephone",
        //		status: "Pending",
        //		creationDate: new Date("December 15, 2013 14:20:02"),
        //		completionDate: new Date("December 15, 2013 16:05:16")
        //	};

        // Setup the dates.
        let creationDate = getCreationDate()
        let completeDate = completionDate()

        let application: CustomObject = ((((CustomObject()
            .custom("appID", value: "7565-2373-0086-8937" as AnyObject) as! CustomObject)
            .custom("source", value: "Telephone" as AnyObject) as! CustomObject)
            .custom("status", value: "Pending" as AnyObject) as! CustomObject)
            .custom("creationDate", value: creationDate as AnyObject) as! CustomObject)
            .custom("completionDate", value: completeDate as AnyObject) as! CustomObject

        // Example Plan object
        //
        // digitalData.plan = {
        //		name: "Family Advantage 250",
        // 		type: "EPO",
        //		policyStatus: "Current",
        //		premium: 454.25,
        //		effectiveDate: new Date("December 15, 2013 16:05:16")
        // };

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

        // Add an existing object
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
