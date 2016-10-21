//
//  Event.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Event {
    fileprivate var parent: DigitalData
    fileprivate var eventInformation: EventInfo!
    fileprivate var eventCategory: Category<Event>!
    fileprivate var eventAttributes: DAttributes<Event>!

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

    public func addAttribute(name: String, value: AnyObject) -> Self {
        if eventAttributes == nil {
            eventAttributes = DAttributes<Event>(parent: self)
        }
        let _ = eventAttributes.attribute(name: name, value: value)
        return self
    }

    public func addPrimaryCategory(primaryCategory: String) -> Self {
        if eventCategory == nil {
            eventCategory = Category<Event>(parent: self)
        }
        let _ = eventCategory.primaryCategory(primaryCategory: primaryCategory)
        return self
    }

    public func addCategory(name: String, value: AnyObject) -> Self {
        if eventCategory == nil {
            eventCategory = Category<Event>(parent: self)
        }
        let _ = eventCategory.category(name: name, value: value)
        return self
    }
}
