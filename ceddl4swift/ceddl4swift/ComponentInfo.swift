//
//  ComponentInfo.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class ComponentInfo: BaseItem<AnyObject> {

    private let COMPONENT_ID_NAME = "componentID"
    private var parent: Component


    /// init an ComponentInfo object.
    /// - Parameter parent: The parent Object
    public init(parent p: Component) {
        parent = p
    }


    /// Returns to the parent Component object.
    /// - Returns: parent Component object
    public func endComponentInfo() -> Component {
        return parent
    }


    /// Sets the componentID.
    /// - Parameter componentID: String
    /// - Returns: current ComponentInfo
    public func componentID(_ componentID: String) -> ComponentInfo {
        addItem(COMPONENT_ID_NAME, value: componentID as AnyObject)
        return self
    }

    public override func returnSelf() -> AnyObject {
        return self
    }
}
