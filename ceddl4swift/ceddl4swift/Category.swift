//
//  Category.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

let PRIMARY_CATEGORY_NAME = "primaryCategory"

public class Category<T>: BaseItem<Category> {

    private var parent: T

    init(parent p: T) {
        parent = p
    }

    public func endCategory() -> T {
        return parent
    }

    public func primaryCategory(primaryCategory: String) -> Category {
        return super.custom(name: PRIMARY_CATEGORY_NAME, value: primaryCategory as AnyObject)
    }

    public func category(name: String, value: AnyObject) -> Category {
        return super.custom(name: name, value: value)
    }

    override func returnSelf() -> Category<T> {
        return self
    }
}
