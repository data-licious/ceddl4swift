//
//  EventInfo.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class EventInfo: BaseItem<EventInfo> {

    private let EVENT_NAME = "eventName"
    private let EVENT_ACTION = "eventAction"
    private let EVENT_POINTS = "eventPoints"
    private let TYPE = "type"
    private let TIME_STAMP = "timeStamp"
    private let CAUSE = "cause"
    private let EFFECT = "effect"

    fileprivate var parent: Event

    init(parent p: Event) {
        parent = p
    }

    public func endEventInfo() -> Event {
        return parent
    }

    public func eventName(eventName: String) -> Self {
        addItem(field: EVENT_NAME, value: eventName as AnyObject)
        return self
    }

    public func eventAction(eventAction: String) -> Self {
        addItem(field: EVENT_ACTION, value: eventAction as AnyObject)
        return self
    }

    public func eventPoints(eventPoints: NSNumber) -> Self {
        addItem(field: EVENT_POINTS, value: eventPoints)
        return self
    }

    public func type(type: String) -> Self {
        addItem(field: TYPE, value: type as AnyObject)
        return self
    }

    public func timeStamp(timeStamp: String) -> Self {
        addItem(field: TIME_STAMP, value: timeStamp as AnyObject)
        return self
    }

    public func timeStamp(timeStamp: Date) -> Self {
        addItem(field: TIME_STAMP, value: timeStamp as AnyObject)
        return self
    }

    public func cause(cause: String) -> Self {
        addItem(field: CAUSE, value: cause as AnyObject)
        return self
    }

    public func effect(effect: String) -> Self {
        addItem(field: EFFECT, value: effect as AnyObject)
        return self
    }
    
    override func returnSelf() -> EventInfo {
        return self
    }
    
}
