//
//  Security.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

class Security: NSObject {
    private var items: Dictionary<String, AnyObject> = [:]

    public func getMap() -> Dictionary<String, AnyObject> {
        return items
    }

    public func addSecurity(_ field: String, accessCategories: Array<String>) {
        if accessCategories.count == 1 {
            items[field] = accessCategories[0] as AnyObject
        } else if accessCategories.count > 1 {
            items[field] = accessCategories as AnyObject
        }
    }
}
