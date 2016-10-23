//
//  EventInfo.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class EventInfo: BaseItem<AnyObject> {

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

    public func eventName(_ eventName: String) -> Self {
        addItem(EVENT_NAME, value: eventName as AnyObject)
        return self
    }

    public func eventAction(_ eventAction: String) -> Self {
        addItem(EVENT_ACTION, value: eventAction as AnyObject)
        return self
    }

    public func eventPoints(_ eventPoints: NSNumber) -> Self {
        addItem(EVENT_POINTS, value: eventPoints)
        return self
    }

    public func type(_ type: String) -> Self {
        addItem(TYPE, value: type as AnyObject)
        return self
    }

    public func timeStamp(_ timeStamp: String) -> Self {
        addItem(TIME_STAMP, value: timeStamp as AnyObject)
        return self
    }

    public func timeStamp(_ timeStamp: Date) -> Self {
        let stringFromDate = dateToString(date: timeStamp)
        addItem(TIME_STAMP, value: stringFromDate as AnyObject)
        return self
    }

    public func cause(_ cause: String) -> Self {
        addItem(CAUSE, value: cause as AnyObject)
        return self
    }

    public func effect(_ effect: String) -> Self {
        addItem(EFFECT, value: effect as AnyObject)
        return self
    }
    
    override func returnSelf() -> AnyObject {
        return self
    }
    
}
