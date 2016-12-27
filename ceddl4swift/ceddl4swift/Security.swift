//
//  Security.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Security: NSObject {

    private var items: Dictionary<String, AnyObject> = [:]

    public func getMap() -> Dictionary<String, AnyObject> {
        return items
    }


    /// Construct a Security object. This is normally handled by calling .security() and .defaultSecurity().
    public override init() {
        super.init()
    }


    /// Adds a field to the Security object.
    /// This is called from .security() and .defaultSecurity().
    ///
    /// - Parameter field: Fieldname
    /// - Parameter accessCategories: accessCategories for field.
    public func addSecurity(field: String, accessCategories: Array<String>) {
        if accessCategories.count == 1 {
            items[field] = accessCategories[0] as AnyObject
        } else if accessCategories.count > 1 {
            items[field] = accessCategories as AnyObject
        }
    }
}
