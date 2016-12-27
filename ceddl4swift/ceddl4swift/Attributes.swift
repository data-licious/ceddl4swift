//
//  Attributes.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class DAttributes<T>: BaseItem<AnyObject> {

    private var parent: T


    /// init an DAttributes object.
    /// - Parameter parent: The parent Object
    public init(parent p: T) {
        parent = p
    }


    /// Returns to the parent object.
    /// - Returns: parent object
    public func endAttributes() -> T {
        return parent
    }


    /// Sets the custom attribute.
    /// - Parameter name: Custom attribute name
    /// - Parameter value: Custom attribute value
    /// - Returns: current object
    public func attribute(name: String, value: AnyObject) -> DAttributes {
        super.addItem(name, value: value)
        return self
    }

    public override func returnSelf() -> AnyObject {
        return self
    }
}
