//
//  BaseItem.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class BaseItem<T>: NSObject {

    private var items: Dictionary<String, AnyObject> = [:]

    //JSON id - security
    private var security: Security!

    private var previousField: String!


    /// Returns the current Object.
    /// - Returns: current object
    internal func returnSelf() -> T {
        return self as! T
    }

    internal func getMap() -> Dictionary<String, AnyObject> {
        var returnDict = items
        if security != nil {
            returnDict["security"] = security.getMap() as AnyObject
        }
        return returnDict
    }

    internal func addItem(field: String, value: AnyObject) {
        items[field] = value
        previousField = field
    }


    /// Add the provided security access categories to the previous Object.
    ///
    /// This method will throw an IllegalStateException when a previous Object is not available.
    ///
    /// - Parameter accessCategories: Array of strings
    /// - Returns: current object
    ///
    /// The following example adds security to `{page.pageInfo.pageName}`
    ///
    ///      DigitalData.create()
    ///       .page()
    ///	      .pageInfo()
    ///       .pageName("Nikon SLR Camera")
    ///       .security("Analytics", "Personalization")
    public func security(accessCategories: Array<String>) throws -> T {
        if previousField == nil {
            throw DigitalDataError.illegalStateException("No field found to secure - Call addSecurity directly after setting a field to secure it.")
        }
        if security == nil {
            security = Security()
        }
        security.addSecurity(previousField, accessCategories: accessCategories)
        return returnSelf()
    }


    /// Add the Default security category to the previous Object.
    ///
    /// This method will throw an IllegalStateException when a previous Object is not available.
    ///
    /// - Returns: current object
    ///
    /// The following example adds security to `{page.pageInfo.pageName}`
    ///
    ///      DigitalData.create()
    ///       .page()
    ///	      .pageInfo()
    ///       .pageName("Nikon SLR Camera")
    ///       .defaultSecurity()
    public func defaultSecurity() throws -> T {
        if previousField == nil {
            throw DigitalDataError.illegalStateException("No field found to secure - Call addDefaultSecurity directly after setting a field to secure it.")
        }
        if security == nil {
            security = Security()
        }
        security.addSecurity(previousField, accessCategories: [DigitalData.DEFAULT_SECURITY])
        return returnSelf()
    }


    /// Add a custom property.
    /// - Parameter name: custom property name
    /// - Parameter value: custom property value
    /// - Returns: current object
    public func custom(name: String, value: AnyObject) -> T {
        addItem(name, value: value)
        return returnSelf()
    }
}
