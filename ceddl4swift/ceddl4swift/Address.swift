//
//  Address.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Address<T>: BaseItem<AnyObject> {

    private let LINE1 = "line1";
    private let LINE2 = "line2";
    private let CITY = "city";
    private let STATE_PROVINCE = "stateProvince";
    private let POSTAL_CODE = "postalCode";
    private let COUNTRY = "country";

    private var parent: T


    /// init an Address object.
    /// - Parameter parent: The parent Object
    public init(parent p: T) {
        parent = p
    }


    /// Returns to the parent object.
    /// - Returns: parent object
    public func endAddress() -> T {
        return parent
    }


    /// Sets the address line 1.
    /// - Parameter line1: String
    /// - Returns: current object
    public func line1(_ line1: String) -> Self {
        addItem(LINE1, value: line1 as AnyObject)
        return self
    }


    /// Sets the address line 2.
    /// - Parameter line2: String
    /// - Returns: current object
    public func line2(_ line2: String) -> Self {
        addItem(LINE2, value: line2 as AnyObject)
        return self
    }


    /// Sets the city.
    /// - Parameter city: String
    /// - Returns: current object
    public func city(_ city: String) -> Self {
        addItem(CITY, value: city as AnyObject)
        return self
    }


    /// Sets the stateProvince.
    /// - Parameter stateProvince: String
    /// - Returns: current object
    public func stateProvince(_ stateProvince: String) -> Self {
        addItem(STATE_PROVINCE, value: stateProvince as AnyObject)
        return self
    }


    /// Sets the postalCode.
    /// - Parameter postalCode: String
    /// - Returns: current object
    public func postalCode(_ postalCode: String) -> Self {
        addItem(POSTAL_CODE, value: postalCode as AnyObject)
        return self
    }


    /// Sets the country.
    /// - Parameter country: String
    /// - Returns: current object
    public func country(_ country: String) -> Self {
        addItem(COUNTRY, value: country as AnyObject)
        return self
    }

    public override func returnSelf() -> AnyObject {
        return self
    }
}
