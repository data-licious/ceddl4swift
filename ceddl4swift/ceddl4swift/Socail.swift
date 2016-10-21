//
//  Socail.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

open class Social: BaseItem<AnyObject> {

    fileprivate var parent: UserProfile


    /// init an Social object.
    /// - Parameter parent: The parent Object
    public init(parent p: UserProfile) {
        parent = p
    }


    /// Returns to the parent UserProfile object.
    /// - Returns: parent UserProfile object
    open func endSocial() -> UserProfile {
        return parent
    }

    /// Adds a social information item.
    ///
    /// - Parameter name: Name of the social information item
    /// - Parameter value: value of the social information item
    /// - Returns: current Social Object
    open func social(_ name: String, value: AnyObject) -> Social {
        return custom(name, value: value) as! Social
    }

    open override func returnSelf() -> AnyObject {
        return self
    }
}
