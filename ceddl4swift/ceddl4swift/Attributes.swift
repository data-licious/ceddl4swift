//
//  Attributes.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class DAttributes<T>: BaseItem<AnyObject> {

    fileprivate var parent: T
    
    init(parent p: T) {
        parent = p
    }

    public func endAttributes() -> T {
        return parent
    }

    public func attribute(_ name: String, value: AnyObject) -> DAttributes {
        super.addItem(name, value: value)
        return self
    }

    override func returnSelf() -> AnyObject {
        return self
    }
}
