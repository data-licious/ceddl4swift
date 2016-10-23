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

    //MARK: - JSON security
    private var security: Security!
    private var previousField: String!

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

    internal func addItem(_ field: String, value: AnyObject) {
        items[field] = value
        previousField = field
    }

    public func security(_ accessCategories: Array<String>) throws -> T {
        if previousField == nil {
            throw DigitalDataError.illegalStateException("No field found to secure - Call addSecurity directly after setting a field to secure it.")
        }
        if security == nil {
            security = Security()
        }
        security.addSecurity(previousField, accessCategories: accessCategories)
        return returnSelf()
    }

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

    public func custom(_ name: String, value: AnyObject) -> T {
        addItem(name, value: value)
        return returnSelf()
    }
}
