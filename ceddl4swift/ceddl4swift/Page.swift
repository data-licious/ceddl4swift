//
//  Page.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Page: NSObject, JSONProtocol {

    fileprivate var parent: DigitalData!

    // MARK : JSON - pageInfo
    fileprivate var pageInformation: PageInfo!

    // MARK : JSON - category
    fileprivate var pageCategory: Category<Page>!

    // MARK : JSON - attributes
    fileprivate var pageAttributes: DAttributes<Page>!

    override init() {
        super.init()
    }

    init(parent p: DigitalData) {
        parent = p
    }

    public func endPage() -> DigitalData {
        return parent
    }

    public func pageInfo() -> PageInfo {
        if pageInformation == nil {
            pageInformation = PageInfo(parent: self)
        }
        return pageInformation
    }

    public func category() -> Category<Page> {
        if pageCategory == nil {
            pageCategory = Category<Page>(parent: self)
        }
        return pageCategory
    }

    public func attributes() -> DAttributes<Page> {
        if pageAttributes == nil {
            pageAttributes = DAttributes<Page>(parent: self)
        }
        return pageAttributes
    }

    public func addAttribute(_ name: String, value: AnyObject) -> Page {
        if pageAttributes == nil {
            pageAttributes = DAttributes<Page>(parent :self)
        }
        if let dateValue = value as? Date {
            let dateStringValue = dateToString(date: dateValue)
            _ = pageAttributes.attribute(name, value: dateStringValue as AnyObject)
        } else {
            _ = pageAttributes.attribute(name, value: value)
        }
        return self
    }

    public func addPrimaryCategory(_ primaryCategory: String) -> Page {
        if pageCategory == nil {
            pageCategory =  Category<Page>(parent: self)
        }
        _ = pageCategory.primaryCategory(primaryCategory)
        return self
    }

    public func addCategory(_ name: String, value: AnyObject) -> Page {
        if pageCategory == nil {
            pageCategory = Category<Page>(parent: self)
        }
        _ = pageCategory.category(name, value: value)
        return self
    }

    func getMap() -> Dictionary<String, AnyObject> {
        var dictionary = Dictionary<String, AnyObject>()
        if pageInformation != nil {
            dictionary["pageInfo"] = pageInformation.getMap() as AnyObject
        }
        if pageCategory != nil {
            dictionary["category"] = pageCategory.getMap() as AnyObject
        }
        if pageAttributes != nil {
            dictionary["attributes"] = pageAttributes.getMap() as AnyObject
        }
        return dictionary
    }
}
