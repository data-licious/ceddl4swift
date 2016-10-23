//
//  AccessCategory.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class AccessCategory: BaseItem<AnyObject> {

    fileprivate let CATEGORY_NAME = "categoryName"
    fileprivate let DOMAINS = "domains"

    fileprivate var parent: Privacy

    init(parent p: Privacy) {
        parent = p
    }

    public func endAccessCategory() -> Privacy {
        return parent
    }

    public func categoryName(_ categoryName: String) -> Self {
        addItem(CATEGORY_NAME, value: categoryName as AnyObject)
        return self
    }

    public func domains(_ domains: Array<String>) -> Self {
        addItem(DOMAINS, value: domains as AnyObject)
        return self
    }

    override func returnSelf() -> AnyObject {
        return self
    }
}
