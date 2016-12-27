//
//  Socail.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Social: BaseItem<AnyObject> {

    private var parent: UserProfile


    /// init an Social object.
    /// - Parameter parent: The parent Object
    public init(parent p: UserProfile) {
        parent = p
    }


    /// Returns to the parent UserProfile object.
    /// - Returns: parent UserProfile object
    public func endSocial() -> UserProfile {
        return parent
    }

    /// Adds a social information item.
    ///
    /// - Parameter name: Name of the social information item
    /// - Parameter value: value of the social information item
    /// - Returns: current Social Object
    public func social(_ name: String, value: AnyObject) -> Social {
        return custom(name, value: value) as! Social
    }

    public override func returnSelf() -> AnyObject {
        return self
    }
}
