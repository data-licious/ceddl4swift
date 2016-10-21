//
//  BaseItem.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class BaseItem<T> {

    private var items: Dictionary<String, AnyObject> = [:]
    private var security: Security!
    private var previousField: String!

    internal func returnSelf() -> T {
        return self as! T
    }

    internal func getMap() -> Dictionary<String, AnyObject> {
        return items
    }

    internal func addItem(field: String, value: AnyObject) {
        items[field] = value
        previousField = field
    }

    public func security(accessCategories: Array<String>) throws {
        if previousField == nil {
            throw SDKError.illegalStateException("No field found to secure - Call addSecurity directly after setting a field to secure it.")
        }
        if security == nil {
            security = Security()
        }
        security.addSecurity(field: previousField, accessCategories: accessCategories)
    }

    public func defaultSecurity() throws -> T {
        if previousField == nil {
            throw SDKError.illegalStateException("No field found to secure - Call addDefaultSecurity directly after setting a field to secure it.")
        }
        if security == nil {
            security = Security()
        }
        security.addSecurity(field: previousField, accessCategories: [DigitalData.DEFAULT_SECURITY])
        return returnSelf()
    }

    public func custom(name: String, value: AnyObject) -> T {
        addItem(field: name, value: value)
        return returnSelf()
    }
}
