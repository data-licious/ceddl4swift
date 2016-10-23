//
//  Privacy.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Privacy: NSObject, JSONProtocol {

    fileprivate var parent: DigitalData!

    //MARK: - JSON accessCategories
    fileprivate var accessCategories: Array<AccessCategory>!

    override init() {
        super.init()
    }

    init(parent p: DigitalData) {
        parent = p
    }

    public func endPrivacy() -> DigitalData {
        return parent
    }

    public func addAccessCategory() -> AccessCategory {
        if accessCategories == nil {
            accessCategories = Array<AccessCategory>()
        }
        let accessCategory = AccessCategory(parent: self)
        accessCategories.append(accessCategory)
        return accessCategory
    }

    public func addDefaultAccessCategory() -> AccessCategory {
        if accessCategories == nil {
            accessCategories = Array<AccessCategory>()
        }
        let accessCategory = AccessCategory(parent: self)
        accessCategories.append(accessCategory)
        _ = accessCategory.categoryName(DigitalData.DEFAULT_SECURITY)
        return accessCategory
    }

    func getMap() -> Dictionary<String, AnyObject> {
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
