//
//  LinkedProduct.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class LinkedProduct<T>: NSObject, JSONProtocol {
    fileprivate var parent: T

    // MARK: - JSON productInfo
    fileprivate var productInformation: ProductInfo<LinkedProduct<T>>!

    init(parent p: T) {
        parent = p
    }

    public func endLinkedProduct() -> T {
        return parent
    }

    public func productInfo() -> ProductInfo<LinkedProduct<T>> {
        if productInformation == nil {
            productInformation = ProductInfo<LinkedProduct<T>>(parent: self)
        }
        return productInformation
    }

    func getMap() -> Dictionary<String, AnyObject> {
        var dictionary = Dictionary<String, AnyObject>()
        dictionary["productInfo"] = productInformation.getMap() as AnyObject
        return dictionary
    }
}
