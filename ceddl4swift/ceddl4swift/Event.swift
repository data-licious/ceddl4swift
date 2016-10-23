//
//  Event.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Event: NSObject, JSONProtocol {

    fileprivate var parent: DigitalData!

    // MARK: - JSON eventInfo
    fileprivate var eventInformation: EventInfo!

    // MARK: - JSON category
    fileprivate var eventCategory: Category<Event>!

    // MARK: - JSON attributes
    fileprivate var eventAttributes: DAttributes<Event>!

    override init() {
        super.init()
    }

    init(parent p: DigitalData) {
        parent = p
    }

    public func endEvent() -> DigitalData {
        return parent
    }

    public func eventInfo() -> EventInfo {
        if eventInformation == nil {
            eventInformation = EventInfo(parent: self)
        }
        return eventInformation
    }

    public func category() -> Category<Event> {
        if eventCategory == nil {
            eventCategory = Category<Event>(parent: self)
        }
        return eventCategory
    }

    public func attributes() -> DAttributes<Event> {
        if eventAttributes == nil {
            eventAttributes = DAttributes<Event>(parent: self)
        }
        return eventAttributes
    }

    public func addAttribute(_ name: String, value: AnyObject) -> Self {
        if eventAttributes == nil {
            eventAttributes = DAttributes<Event>(parent: self)
        }
        _ = eventAttributes.attribute(name, value: value)
        return self
    }

    public func addPrimaryCategory(_ primaryCategory: String) -> Self {
        if eventCategory == nil {
            eventCategory = Category<Event>(parent: self)
        }
        _ = eventCategory.primaryCategory(primaryCategory)
        return self
    }

    public func addCategory(_ name: String, value: AnyObject) -> Self {
        if eventCategory == nil {
            eventCategory = Category<Event>(parent: self)
        }
        _ = eventCategory.category(name, value: value)
        return self
    }

    func getMap() -> Dictionary<String, AnyObject> {
        var dictionary = Dictionary<String, AnyObject>()
        if eventInformation != nil {
            dictionary["eventInfo"] = eventInformation.getMap() as AnyObject
        }
        if eventCategory != nil {
            dictionary["category"] = eventCategory.getMap() as AnyObject
        }
        if eventAttributes != nil {
            dictionary["attributes"] = eventAttributes.getMap() as AnyObject
        }
        return dictionary
    }
}
