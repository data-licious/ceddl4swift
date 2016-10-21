//
//  AccessCategory.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class AccessCategory: BaseItem<AccessCategory> {

    fileprivate let CATEGORY_NAME = "categoryName"
    fileprivate let DOMAINS = "domains"

    fileprivate var parent: Privacy

    init(parent p: Privacy) {
        parent = p
    }

    public func endAccessCategory() -> Privacy {
        return parent
    }

    public func categoryName(categoryName: String) -> Self {
        addItem(field: CATEGORY_NAME, value: categoryName as AnyObject)
        return self
    }

    public func domains(domains: Array<String>) -> Self {
        addItem(field: DOMAINS, value: domains as AnyObject)
        return self
    }

    override func returnSelf() -> AccessCategory {
        return self
    }
}
