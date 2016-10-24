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

    //JSON id - eventInfo
    fileprivate var eventInformation: EventInfo!

    //JSON id - category
    fileprivate var eventCategory: Category<Event>!

    //JSON id - attributes
    fileprivate var eventAttributes: DAttributes<Event>!

    
    /// init `Event` object.
    override init() {
        super.init()
    }


    /// init `Event` object.
    /// - Parameter parent: associated DigitalData.
    init(parent p: DigitalData) {
        parent = p
    }

    
    /// Returns to the parent object.
    /// - Returns: Parent object
    public func endEvent() -> DigitalData {
        return parent
    }


    /// Provides access to the EventInfo object for this Event.
    ///
    /// This object describes the event.
    ///
    /// - Returns: EventInfo Object for this Event
    public func eventInfo() -> EventInfo {
        if eventInformation == nil {
            eventInformation = EventInfo(parent: self)
        }
        return eventInformation
    }


    /// Provides access to the Category object for the Event.
    /// - Returns: Category object for this Event
    public func category() -> Category<Event> {
        if eventCategory == nil {
            eventCategory = Category<Event>(parent: self)
        }
        return eventCategory
    }


    /// Provides access to the Attributes object for this Event.
    /// - Returns: Attributes object for this Event
    public func attributes() -> DAttributes<Event> {
        if eventAttributes == nil {
            eventAttributes = DAttributes<Event>(parent: self)
        }
        return eventAttributes
    }


    /// Directly adds a new attribute to the Events's attributes
    /// - Parameter name: Name of the attribute
    /// - Parameter value: Value for the attribute
    /// - Returns: current Event.
    public func addAttribute(_ name: String, value: AnyObject) -> Self {
        if eventAttributes == nil {
            eventAttributes = DAttributes<Event>(parent: self)
        }
        _ = eventAttributes.attribute(name, value: value)
        return self
    }


    /// Directly sets the primary category for the Event
    /// - Parameter primaryCategory: Value for the primary category
    /// - Returns: current Event.
    public func addPrimaryCategory(_ primaryCategory: String) -> Self {
        if eventCategory == nil {
            eventCategory = Category<Event>(parent: self)
        }
        _ = eventCategory.primaryCategory(primaryCategory)
        return self
    }

    /// Directly adds a custom category to the Event's categories
    /// - Parameter name: Name of the category
    /// - Parameter value: Value for the attribute
    /// - Returns: current Event.
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
