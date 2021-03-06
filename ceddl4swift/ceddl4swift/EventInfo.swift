//
//  EventInfo.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

open class EventInfo: BaseItem<AnyObject> {

    private let EVENT_NAME = "eventName"
    private let EVENT_ACTION = "eventAction"
    private let EVENT_POINTS = "eventPoints"
    private let TYPE = "type"
    private let TIME_STAMP = "timeStamp"
    private let CAUSE = "cause"
    private let EFFECT = "effect"

    fileprivate var parent: Event


    /// init an EventInfo object.
    /// - Parameter parent: The parent Object
    public init(parent p: Event) {
        parent = p
    }


    /// Returns to the parent Event object.
    /// - Returns: parent Event object
    open func endEventInfo() -> Event {
        return parent
    }


    /// Sets the eventName.
    ///
    /// The eventInfo object MUST include eventName.
    ///
    /// - Parameter eventName: String
    /// - Returns: current EventInfo
    open func eventName(_ eventName: String) -> Self {
        addItem(EVENT_NAME, value: eventName as AnyObject)
        return self
    }


    /// Sets the eventAction.
    /// - Parameter eventAction: String
    /// - Returns: current EventInfo
    open func eventAction(_ eventAction: String) -> Self {
        addItem(EVENT_ACTION, value: eventAction as AnyObject)
        return self
    }


    /// Sets the eventPoints.
    /// - Parameter eventPoints: NSNumber
    /// - Returns: current EventInfo
    open func eventPoints(_ eventPoints: NSNumber) -> Self {
        addItem(EVENT_POINTS, value: eventPoints)
        return self
    }


    /// Sets the Type.
    /// - Parameter type: String
    /// - Returns: current EventInfo
    open func type(_ type: String) -> Self {
        addItem(TYPE, value: type as AnyObject)
        return self
    }


    /// Sets the TimeStamp.
    /// - Parameter timeStamp: String
    /// - Returns: current EventInfo
    open func timeStamp(_ timeStamp: String) -> Self {
        addItem(TIME_STAMP, value: timeStamp as AnyObject)
        return self
    }


    /// Sets the TimeStamp.
    /// - Parameter timeStamp: Date
    /// - Returns: current EventInfo
    open func timeStamp(_ timeStamp: Date) -> Self {
        let stringFromDate = dateToString(timeStamp)
        addItem(TIME_STAMP, value: stringFromDate as AnyObject)
        return self
    }

    /// Sets the Cause.
    /// - Parameter cause: Date
    /// - Returns: current EventInfo
    open func cause(_ cause: String) -> Self {
        addItem(CAUSE, value: cause as AnyObject)
        return self
    }


    /// Sets the Effect.
    /// - Parameter effect: Date
    /// - Returns: current EventInfo
    open func effect(_ effect: String) -> Self {
        addItem(EFFECT, value: effect as AnyObject)
        return self
    }
    
    open override func returnSelf() -> AnyObject {
        return self
    }
    
}
