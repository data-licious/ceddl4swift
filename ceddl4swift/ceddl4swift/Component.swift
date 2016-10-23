//
//  Component.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Component: NSObject, JSONProtocol {

    fileprivate var parent: DigitalData!

    // MARK: - JSON componentInfo
    fileprivate var componentInformation: ComponentInfo!

    // MARK: - JSON category
    fileprivate var componentCategory: Category<Component>!

    // MARK: - JSON attributes
    fileprivate var componentAttributes: DAttributes<Component>!

    override init() {
        super.init()
    }

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

    public func addAttribuut(_ name: String, value: AnyObject) -> Component {
        if componentAttributes == nil {
            componentAttributes = DAttributes<Component>(parent: self)
        }
        _ = componentAttributes.attribute(name, value: value)
        return self
    }

    public func addPrimaryCategory(_ primaryCategory: String) -> Component {
        if componentCategory == nil {
            componentCategory = Category<Component>(parent: self)
        }
        _ = componentCategory.category(PRIMARY_CATEGORY_NAME, value: primaryCategory as AnyObject)
        return self
    }

    public func addCategory(_ name: String, value: AnyObject) -> Component {
        if componentCategory == nil {
            componentCategory = Category<Component>(parent: self)
        }
        _ = componentCategory.category(name, value: value)
        return self
    }

    func getMap() -> Dictionary<String, AnyObject> {
        var dictionary = Dictionary<String, AnyObject>()
        if componentInformation != nil {
            dictionary["componentInfo"] = componentInformation.getMap() as AnyObject
        }
        if componentCategory != nil {
            dictionary["category"] = componentCategory.getMap() as AnyObject
        }
        if componentAttributes != nil {
            dictionary["attributes"] = componentAttributes.getMap() as AnyObject
        }
        return dictionary
    }
}
