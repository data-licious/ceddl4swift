//
//  Component.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Component {

    fileprivate var parent: DigitalData
    fileprivate var componentInformation: ComponentInfo!
    fileprivate var componentCategory: Category<Component>!
    fileprivate var componentAttributes: DAttributes<Component>!

    init(parent p: DigitalData) {
        parent = p
    }

    public func endComponent() -> DigitalData {
        return parent
    }

    public func componentInfo() -> ComponentInfo {
        if componentInformation == nil {
            componentInformation = ComponentInfo(parent: self)
        }
        return componentInformation;
    }

    public func category() -> Category<Component> {
        if componentCategory == nil {
            componentCategory = Category<Component>(parent: self)
        }
        return componentCategory
    }

    public func attributes() -> DAttributes<Component> {
        if componentAttributes == nil {
            componentAttributes = DAttributes<Component>(parent: self)
        }
        return componentAttributes
    }

    public func addAttribuut(name: String, value: AnyObject) -> Component {
        if componentAttributes == nil {
            componentAttributes = DAttributes<Component>(parent: self)
        }
        let _ = componentAttributes.attribute(name: name, value: value)
        return self
    }

    public func addPrimaryCategory(primaryCategory: String) -> Component {
        if componentCategory == nil {
            componentCategory = Category<Component>(parent: self)
        }
        let _ = componentCategory.category(name: PRIMARY_CATEGORY_NAME, value: primaryCategory as AnyObject)
        return self
    }

    public func addCategory(name: String, value: AnyObject) -> Component {
        if componentCategory == nil {
            componentCategory = Category<Component>(parent: self)
        }
        let _ = componentCategory.category(name: name, value: value)
        return self
    }
}
