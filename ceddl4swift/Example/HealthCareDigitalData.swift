//
//  HealthCareDigitalData.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 23/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class HealthCareDigitalData: DigitalData {

    private var member: Array<CustomObject>!
    private var application: CustomObject!
    private var plan: CustomObject!

    public func addMember(_ newMember: CustomObject) -> Self {
        if member == nil {
            member = Array<CustomObject>()
        }
        member.append(newMember)
        return self
    }

    public func setApplication(_ app: CustomObject) -> Self {
        application = app
        return self
    }

    public func setPlan(_ plan: CustomObject) -> Self {
        self.plan = plan
        return self
    }

    override public func getMap() -> Dictionary<String, AnyObject> {
        var dictionary = Dictionary<String, AnyObject>()
        dictionary = dictionary + super.getMap()
        if member != nil {
            var memberDictionary = Array<Dictionary<String, AnyObject>>()
            for mem in member {
                memberDictionary.append(mem.getMap())
            }
            dictionary["member"] = memberDictionary as AnyObject
        }
        if application != nil {
            dictionary["application"] = application.getMap() as AnyObject
        }
        if plan != nil {
            dictionary["plan"] = plan.getMap() as AnyObject
        }
        return dictionary
    }
}
