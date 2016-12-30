//
//  LinkedProduct.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

open class LinkedProduct<T>: NSObject, JSONProtocol {

    fileprivate var parent: T

    //JSON id - productInfo
    fileprivate var productInformation: ProductInfo<LinkedProduct<T>>!


    /// init `LinkedProduct` object.
    /// - Parameter parent: reutrns parent object.
    public init(parent p: T) {
        parent = p
    }


    /// Returns to the parent object.
    /// - Returns: Parent object
    open func endLinkedProduct() -> T {
        return parent
    }


    /// Provides access to the linked product ProductInfo object.
    /// - Returns: ProductInfo object for this LinkedProduct
    open func productInfo() -> ProductInfo<LinkedProduct<T>> {
        if productInformation == nil {
            productInformation = ProductInfo<LinkedProduct<T>>(parent: self)
        }
        return productInformation
    }

    open func getMap() -> Dictionary<String, AnyObject> {
        var dictionary = Dictionary<String, AnyObject>()
        dictionary["productInfo"] = productInformation.getMap() as AnyObject
        return dictionary
    }
}
