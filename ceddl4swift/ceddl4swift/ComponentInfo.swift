//
//  ComponentInfo.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class ComponentInfo: BaseItem<ComponentInfo> {
    fileprivate let COMPONENT_ID_NAME = "componentID"
    fileprivate var parent: Component

    init(parent p: Component) {
        parent = p
    }

    public func endComponent() -> Component {
        return parent
    }

    public func componentID(componentID: String) -> ComponentInfo {
        addItem(field: COMPONENT_ID_NAME, value: componentID as AnyObject)
        return self
    }

    override func returnSelf() -> ComponentInfo {
        return self
    }
}
