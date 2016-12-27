//
//  Segment.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Segment: BaseItem<AnyObject> {

    private var parent: User


    /// init an Segment object.
    /// - Parameter parent: The parent Object
    public init(parent p: User) {
        parent = p
    }


    /// Returns to the parent User object.
    /// - Returns: parent User object
    public func endSegment() -> User {
        return parent
    }


    /// Adds a segment information item.
    ///
    /// - Parameter name: Name of the segment information item
    /// - Parameter value: value of the segment information item
    /// - Returns: current Segment Object
    public func segment(name: String, value: AnyObject) -> Segment {
        return custom(name, value: value) as! Segment
    }

    public override func returnSelf() -> AnyObject {
        return self
    }
}
