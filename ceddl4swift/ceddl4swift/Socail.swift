//
//  Socail.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Social: BaseItem<Social> {

    fileprivate var parent: UserProfile

    init(parent p: UserProfile) {
        parent = p
    }

    public func endProfile() -> UserProfile {
        return parent
    }

    public func social(name: String, value: AnyObject) -> Social {
        return custom(name: name, value: value)
    }

    override func returnSelf() -> Social {
        return self
    }
}
