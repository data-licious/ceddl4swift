//
//  AccessCategory.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class AccessCategory: BaseItem<AnyObject> {

    private let CATEGORY_NAME = "categoryName"
    private let DOMAINS = "domains"

    private var parent: Privacy


    /// init an AccessCategory object.
    /// - Parameter parent: The parent Object
    public init(parent p: Privacy) {
        parent = p
    }


    /// Returns to the parent Privacy object.
    /// - Returns: parent Privacy object
    public func endAccessCategory() -> Privacy {
        return parent
    }


    /// Sets the categoryName.
    /// Definition of category names to be associated with security objects with
    /// the matching name. A categoryName of Default MUST be included for privacy
    /// enforcement. All other categories are custom. Common categories include
    /// Analytics, Recommendations, and Personalization.
    ///
    /// - Parameter categoryName: string
    /// - Returns: current Object
    public func categoryName(_ categoryName: String) -> Self {
        addItem(CATEGORY_NAME, value: categoryName as AnyObject)
        return self
    }


    /// Sets the domains.
    ///
    /// Particular vendors associated with the particular category. This SHOULD
    /// be an array listing domains for vendors associated with the category. The
    /// Default category SHOULD contain all technologies which must be treated
    /// the same as first party for privacy purposes (e.g., a tag management
    /// technology).
    ///
    /// - Parameter domains: String
    /// - Returns: current Object
    public func domains(_ domains: Array<String>) -> Self {
        addItem(DOMAINS, value: domains as AnyObject)
        return self
    }

    public override func returnSelf() -> AnyObject {
        return self
    }
}
