//
//  Socail.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Social: BaseItem<AnyObject> {

    fileprivate var parent: UserProfile

    init(parent p: UserProfile) {
        parent = p
    }

    public func endSocial() -> UserProfile {
        return parent
    }

    public func social(_ name: String, value: AnyObject) -> Social {
        return custom(name, value: value) as! Social
    }

    override func returnSelf() -> AnyObject {
        return self
    }
}
