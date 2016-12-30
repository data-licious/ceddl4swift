//
//  Privacy.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

open class Privacy: NSObject, JSONProtocol {

    fileprivate var parent: DigitalData!

    //JSON id - accessCategories
    fileprivate var accessCategories: Array<AccessCategory>!


    /// init `Privacy` object.
    public override init() {
        super.init()
    }


    /// init `Privacy` object.
    /// - Parameter parent: associated DigitalData.
    public init(parent p: DigitalData) {
        parent = p
    }


    /// Returns to the parent object.
    /// - Returns: Parent object
    open func endPrivacy() -> DigitalData {
        return parent
    }


    /// Adds a new AccessCategory.
    ///
    /// - Returns: a new AccessCategory object
    open func addAccessCategory() -> AccessCategory {
        if accessCategories == nil {
            accessCategories = Array<AccessCategory>()
        }
        let accessCategory = AccessCategory(parent: self)
        accessCategories.append(accessCategory)
        return accessCategory
    }


    /// Adds the Default AccessCategory.
    ///
    /// - Returns: a new AccessCategory object
    open func addDefaultAccessCategory() -> AccessCategory {
        if accessCategories == nil {
            accessCategories = Array<AccessCategory>()
        }
        let accessCategory = AccessCategory(parent: self)
        accessCategories.append(accessCategory)
        _ = accessCategory.categoryName(DigitalData.DEFAULT_SECURITY)
        return accessCategory
    }

    open func getMap() -> Dictionary<String, AnyObject> {
        var dictionary = Dictionary<String, AnyObject>()
        if accessCategories != nil {
            var accessDictionary = Array<Dictionary<String, AnyObject>>()
            for accessCategory in accessCategories {
                accessDictionary.append(accessCategory.getMap())
            }
            dictionary["accessCategories"] = accessDictionary as AnyObject
        }
        return dictionary
    }
}
