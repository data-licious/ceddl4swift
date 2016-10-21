//
//  Address.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Address<T>: BaseItem<Address> {

    private let LINE1 = "line1";
    private let LINE2 = "line2";
    private let CITY = "city";
    private let STATE_PROVINCE = "stateProvince";
    private let POSTAL_CODE = "postalCode";
    private let COUNTRY = "country";

    fileprivate var parent: T

    init(parent p: T) {
        parent = p
    }

    public func endAddress() -> T {
        return parent
    }

    public func line1(line1: String) -> Self {
        addItem(field: LINE1, value: line1 as AnyObject)
        return self
    }

    public func line2(line2: String) -> Self {
        addItem(field: LINE2, value: line2 as AnyObject)
        return self
    }

    public func city(city: String) -> Self {
        addItem(field: CITY, value: city as AnyObject)
        return self
    }

    public func stateProvince(stateProvince: String) -> Self {
        addItem(field: STATE_PROVINCE, value: stateProvince as AnyObject)
        return self
    }

    public func postalCode(postalCode: String) -> Self {
        addItem(field: POSTAL_CODE, value: postalCode as AnyObject)
        return self
    }

    public func country(country: String) -> Self {
        addItem(field: COUNTRY, value: country as AnyObject)
        return self
    }
}
