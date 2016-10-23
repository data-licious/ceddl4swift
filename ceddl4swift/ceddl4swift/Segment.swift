//
//  Segment.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Segment: BaseItem<AnyObject> {
    fileprivate var parent: User

    init(parent p: User) {
        parent = p
    }

    public func endSegment() -> User {
        return parent
    }

    public func segment(_ name: String, value: AnyObject) -> Segment {
        return custom(name, value: value) as! Segment
    }

    override func returnSelf() -> AnyObject {
        return self
    }
}
