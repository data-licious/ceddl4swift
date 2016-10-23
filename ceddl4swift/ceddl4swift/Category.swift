//
//  Category.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

let PRIMARY_CATEGORY_NAME = "primaryCategory"

public class Category<T>: BaseItem<AnyObject> {

    private var parent: T

    init(parent p: T) {
        parent = p
    }

    public func endCategory() -> T {
        return parent
    }

    public func primaryCategory(_ primaryCategory: String) -> Category {
        return super.custom(PRIMARY_CATEGORY_NAME, value: primaryCategory as AnyObject) as! Category<T>
    }

    public func category(_ name: String, value: AnyObject) -> Category {
        return super.custom(name, value: value) as! Category<T>
    }

    override func returnSelf() -> AnyObject {
        return self
    }
}
