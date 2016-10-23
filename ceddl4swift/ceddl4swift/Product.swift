//
//  Product.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Product: NSObject, JSONProtocol {

    fileprivate var parent: DigitalData!

    // MARK : JSON - productInfo
    fileprivate var productInformation: ProductInfo<Product>!

    // MARK : JSON - category
    fileprivate var productCategory: Category<Product>!

    // MARK : JSON - linkedProducts
    fileprivate var linkedProducts: Array<LinkedProduct<Product>>!

    // MARK : JSON - attributes
    fileprivate var productAttributes: DAttributes<Product>!

    override init() {
        super.init()
    }

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

    public func addAttribute(_ name: String, value: AnyObject) -> Self {
        if productAttributes == nil {
            productAttributes = DAttributes<Product>(parent: self)
        }
        _ = productAttributes.attribute(name, value: value)
        return self
    }

    public func addPrimaryCategory(_ primaryCategory: String) -> Self {
        if productCategory == nil {
            productCategory = Category<Product>(parent: self)
        }
        _ = productCategory.primaryCategory(primaryCategory)
        return self
    }

    public func addCategory(_ name: String, value: AnyObject) -> Self {
        if productCategory == nil {
            productCategory = Category<Product>(parent: self)
        }
        _ = productCategory.category(name, value: value)
        return self
    }

    func getMap() -> Dictionary<String, AnyObject> {
        var dictionary = Dictionary<String, AnyObject>()
        if productInformation != nil {
            dictionary["productInfo"] = productInformation.getMap() as AnyObject
        }
        if productCategory != nil {
            dictionary["category"] = productCategory.getMap() as AnyObject
        }
        if linkedProducts != nil {
            var linkedProductDictionary = Array<Dictionary<String, AnyObject>>()
            for linkedProduct in linkedProducts {
                linkedProductDictionary.append(linkedProduct.getMap())
            }
            dictionary["linkedProducts"] = linkedProductDictionary as AnyObject
        }
        if productAttributes != nil {
            dictionary["attributes"] = productAttributes.getMap() as AnyObject
        }
        return dictionary
    }
}
