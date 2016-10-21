//
//  Product.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Product {

    fileprivate var parent: DigitalData
    fileprivate var productInformation: ProductInfo<Product>!
    fileprivate var productCategory: Category<Product>!
    fileprivate var linkedProducts: Array<LinkedProduct<Product>>!
    fileprivate var productAttributes: DAttributes<Product>!

    init(parent p: DigitalData) {
        parent = p
    }

    public func endProduct() -> DigitalData {
        return parent
    }

    public func productInfo() -> ProductInfo<Product> {
        if productInformation == nil {
            productInformation = ProductInfo<Product>(parent: self)
        }
        return productInformation
    }

    public func category() -> Category<Product> {
        if productCategory == nil {
            productCategory = Category<Product>(parent: self)
        }
        return productCategory
    }

    public func addLinkedProduct() -> LinkedProduct<Product> {
        if linkedProducts == nil {
            linkedProducts = Array<LinkedProduct<Product>>()
        }
        let linkedProduct = LinkedProduct<Product>(parent: self)
        linkedProducts.append(linkedProduct)
        return linkedProduct
    }

    public func attributes() -> DAttributes<Product> {
        if productAttributes == nil {
            productAttributes = DAttributes<Product>(parent: self)
        }
        return productAttributes
    }

    public func addAttribute(name: String, value: AnyObject) -> Self {
        if productAttributes == nil {
            productAttributes = DAttributes<Product>(parent: self)
        }
        let _ = productAttributes.attribute(name: name, value: value)
        return self
    }

    public func addPrimaryCategory(primaryCategory: String) -> Self {
        if productCategory == nil {
            productCategory = Category<Product>(parent: self)
        }
        let _ = productCategory.primaryCategory(primaryCategory: primaryCategory)
        return self
    }

    public func addCategory(name: String, value: AnyObject) -> Self {
        if productCategory == nil {
            productCategory = Category<Product>(parent: self)
        }
        let _ = productCategory.category(name: name, value: value)
        return self
    }
}
