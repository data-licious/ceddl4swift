//
//  Page.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Page {
    fileprivate var parent: DigitalData!
    fileprivate var pageInfo: PageInfo!
    fileprivate var category: Category<Page>!
    fileprivate var attributes: DAttributes<Page>!

    init(parent p: DigitalData) {
        parent = p
    }

    public func endPage() -> DigitalData {
        return parent
    }

    public func pageInformation() -> PageInfo {
        if pageInfo == nil {
            pageInfo = PageInfo(parent: self)
        }
        return pageInfo
    }

    public func pageCategory() -> Category<Page> {
        if category == nil {
            category = Category<Page>(parent: self)
        }
        return category
    }

    public func pageAttributes() -> DAttributes<Page> {
        if attributes == nil {
            attributes = DAttributes<Page>(parent: self)
        }
        return attributes
    }

    public func addAttribute(name: String, value: AnyObject) -> Page {
        if attributes == nil {
            attributes = DAttributes<Page>(parent :self)
        }
        let _ = attributes.attribute(name: name, value: value)
        return self
    }

    public func addPrimaryCategory(primaryCategory: String) -> Page {
        if category == nil {
            category =  Category<Page>(parent: self)
        }
        let _ = category.primaryCategory(primaryCategory: primaryCategory)
        return self
    }

    public func addCategory(name: String, value: AnyObject) -> Page {
        if category == nil {
            category = Category<Page>(parent: self)
        }
        let _ = category.category(name: name, value: value)
        return self
    }
}
