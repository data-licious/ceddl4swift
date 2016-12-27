//
//  Component.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

///
/// The Component object is intended to capture information about a content
/// component included as part of a page, such as a video. Interactions with the
/// component such as playing the video would be an Event.
///

public class Component: NSObject, JSONProtocol {

    private var parent: DigitalData!

    //JSON id -  componentInfo
    private var componentInformation: ComponentInfo!

    //JSON id - category
    private var componentCategory: Category<Component>!

    //JSON id - attributes
    private var componentAttributes: DAttributes<Component>!


    /// init `Component` object.
    public override init() {
        super.init()
    }


    /// init `Component` object.
    /// - Parameter parent: associated DigitalData.
    public init(parent p: DigitalData) {
        parent = p
    }


    /// Returns to the parent object.
    /// - Returns: Parent object
    public func endComponent() -> DigitalData {
        return parent
    }


    /// Provides access to the ComnponentInfo object.
    ///
    /// ComponentInfo describes the component.
    ///
    /// - Returns: The ComponentInfo object for this Component
    public func componentInfo() -> ComponentInfo {
        if componentInformation == nil {
            componentInformation = ComponentInfo(parent: self)
        }
        return componentInformation;
    }


    /// Provides access to the Category object for the Component.
    ///
    /// Because of the wide range of methods for categorization, an object
    /// literal is provided for component categories.
    ///
    /// - Returns: Category object for the Component
    public func category() -> Category<Component> {
        if componentCategory == nil {
            componentCategory = Category<Component>(parent: self)
        }
        return componentCategory
    }


    /// Provides access to the Attributes object for the Component.
    ///
    /// This object provides extensibility to each component. Any additional
    /// dimensions related to the component can be provided. All names are
    /// optional and should fit the individual implementation needs in both
    /// naming and values passed.
    ///
    /// - Returns: Attributes object for the Component
    public func attributes() -> DAttributes<Component> {
        if componentAttributes == nil {
            componentAttributes = DAttributes<Component>(parent: self)
        }
        return componentAttributes
    }


    /// Directly adds a new attribute to the Component's attributes
    /// - Parameter name: Name of the attribute
    /// - Parameter value: Value for the attribute
    /// - Returns: current Component.
    public func addAttribuut(_ name: String, value: AnyObject) -> Component {
        if componentAttributes == nil {
            componentAttributes = DAttributes<Component>(parent: self)
        }
        _ = componentAttributes.attribute(name, value: value)
        return self
    }


    /// Directly adds the primary category to the Component's categories.
    /// - Parameter primaryCategory: Value for the primary category
    /// - Returns: current Component.
    public func addPrimaryCategory(_ primaryCategory: String) -> Component {
        if componentCategory == nil {
            componentCategory = Category<Component>(parent: self)
        }
        _ = componentCategory.category(PRIMARY_CATEGORY_NAME, value: primaryCategory as AnyObject)
        return self
    }


    /// Directly adds a custom category to the Component's categories.
    /// - Parameter name: Name of the category
    /// - Parameter value: Value for the attribute
    /// - Returns: current Component.
    public func addCategory(_ name: String, value: AnyObject) -> Component {
        if componentCategory == nil {
            componentCategory = Category<Component>(parent: self)
        }
        _ = componentCategory.category(name, value: value)
        return self
    }

    public func getMap() -> Dictionary<String, AnyObject> {
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
