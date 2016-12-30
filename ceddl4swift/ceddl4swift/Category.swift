//
//  Category.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

let PRIMARY_CATEGORY_NAME = "primaryCategory"

open class Category<T>: BaseItem<AnyObject> {

    private var parent: T


    /// init an Category object.
    /// - Parameter parent: The parent Object
    public init(parent p: T) {
        parent = p
    }


    /// Returns to the parent object.
    /// - Returns: parent object
    open func endCategory() -> T {
        return parent
    }


    /// Sets the primaryCategory.
    ///
    /// The name primaryCategory is RECOMMENDED if you included only one set of
    /// categories for products, or for your primary set of categories.
    ///
    /// - Parameter primaryCategory value: primaryCategory value value
    /// - Returns: current object
    open func primaryCategory(_ primaryCategory: String) -> Category {
        return super.custom(PRIMARY_CATEGORY_NAME, value: primaryCategory as AnyObject) as! Category<T>
    }


    /// Sets the custom category.
    /// - Parameter name: Custom attribute name
    /// - Parameter value: Custom attribute value
    /// - Returns: current object
    open func category(_ name: String, value: AnyObject) -> Category {
        return super.custom(name, value: value) as! Category<T>
    }

    open override func returnSelf() -> AnyObject {
        return self
    }
}
