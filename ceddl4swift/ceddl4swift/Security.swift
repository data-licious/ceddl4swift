//
//  Security.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

class Security {
    private var items: Dictionary<String, Any> = [:]

    public func getMap() -> Dictionary<String, Any> {
        return items
    }

    public func addSecurity(field: String, accessCategories: Array<String>) {
        if accessCategories.count == 1 {
            items[field] = accessCategories[0]
        } else if accessCategories.count > 1 {
            items[field] = accessCategories
        }
    }
}
