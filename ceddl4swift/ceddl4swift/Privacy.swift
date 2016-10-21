//
//  Privacy.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Privacy {

    fileprivate var parent: DigitalData
    fileprivate var accessCategories: Array<AccessCategory>!

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
        let _ = accessCategory.categoryName(categoryName: DigitalData.DEFAULT_SECURITY)
        return accessCategory
    }
}
