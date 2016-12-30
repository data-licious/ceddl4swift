//
//  Page.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

open class Page: NSObject, JSONProtocol {

    fileprivate var parent: DigitalData!

    //JSON id - pageInfo
    fileprivate var pageInformation: PageInfo!

    //JSON id - category
    fileprivate var pageCategory: Category<Page>!

    //JSON id - attributes
    fileprivate var pageAttributes: DAttributes<Page>!


    /// init
    /// Constructs an `Page` object.
    public override init() {
        super.init()
    }


    /// init `Page` object.
    /// - Parameter parent: associated DigitalData.
    public init(parent p: DigitalData) {
        parent = p
    }


    /// Returns to the parent object.
    /// - Returns: Parent object
    open func endPage() -> DigitalData {
        return parent
    }


    /// Provides access to the PageInfo object for this Page.
    ///
    /// This object describes the Page.
    ///
    /// - Returns: PageInfo Object for this Page
    open func pageInfo() -> PageInfo {
        if pageInformation == nil {
            pageInformation = PageInfo(parent: self)
        }
        return pageInformation
    }


    /// Provides access to the Category object for the Page.
    ///
    /// Because of the wide range of methods for categorization, an object
    /// literal is provided for page categories. The name primaryCategory is
    /// RECOMMENDED if you included only one set of categories for pages, or for
    /// your primary set of categories. All other names are optional and should
    /// fit the individual implementation needs in both naming and values passed.
    ///
    /// - Returns: Category object for this Page
    open func category() -> Category<Page> {
        if pageCategory == nil {
            pageCategory = Category<Page>(parent: self)
        }
        return pageCategory
    }


    /// Provides access to the Attributes object for the Page.
    ///
    /// This object provides extensibility to the Page object. All names are
    /// optional and should fit the individual implementation needs in both
    /// naming and values passed.
    ///
    /// - Returns: Attributes object for this Page
    open func attributes() -> DAttributes<Page> {
        if pageAttributes == nil {
            pageAttributes = DAttributes<Page>(parent: self)
        }
        return pageAttributes
    }


    /// Directly adds a new attribute to the Page's attributes
    /// - Parameter name: Name of the attribute
    /// - Parameter value: Value for the attribute
    /// - Returns: current object
    open func addAttribute(_ name: String, value: AnyObject) -> Page {
        if pageAttributes == nil {
            pageAttributes = DAttributes<Page>(parent :self)
        }
        if let dateValue = value as? Date {
            let dateStringValue = dateToString(dateValue)
            _ = pageAttributes.attribute(name, value: dateStringValue as AnyObject)
        } else {
            _ = pageAttributes.attribute(name, value: value)
        }
        return self
    }


    /// Directly adds the primary category to the Page's categories
    /// - Parameter primaryCategory: Value for the primary category
    /// - Returns: current object.
    open func addPrimaryCategory(_ primaryCategory: String) -> Page {
        if pageCategory == nil {
            pageCategory =  Category<Page>(parent: self)
        }
        _ = pageCategory.primaryCategory(primaryCategory)
        return self
    }


    /// Directly adds a custom category to the Page's categories
    /// - Parameter name: Name of the category
    /// - Parameter value: Value for the attribute
    /// - Returns: current object.
    open func addCategory(_ name: String, value: AnyObject) -> Page {
        if pageCategory == nil {
            pageCategory = Category<Page>(parent: self)
        }
        _ = pageCategory.category(name, value: value)
        return self
    }

    open func getMap() -> Dictionary<String, AnyObject> {
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
