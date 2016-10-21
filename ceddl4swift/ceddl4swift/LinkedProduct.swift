//
//  LinkedProduct.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class LinkedProduct<T> {
    fileprivate var parent: T
    fileprivate var productInformation: ProductInfo<LinkedProduct<T>>!

    init(parent p: T) {
        parent = p
    }

    public func endProduct() -> T {
        return parent
    }

    public func productInfo() -> ProductInfo<LinkedProduct<T>> {
        if productInformation == nil {
            productInformation = ProductInfo<LinkedProduct<T>>(parent: self)
        }
        return productInformation
    }
}
