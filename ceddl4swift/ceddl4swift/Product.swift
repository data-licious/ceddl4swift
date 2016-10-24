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

    //JSON id - productInfo
    fileprivate var productInformation: ProductInfo<Product>!

    //JSON id - category
    fileprivate var productCategory: Category<Product>!

    //JSON id - linkedProducts
    fileprivate var linkedProducts: Array<LinkedProduct<Product>>!

    //JSON id - attributes
    fileprivate var productAttributes: DAttributes<Product>!


    /// init `Product` object.
    override init() {
        super.init()
    }


    /// init `Product` object.
    /// - Parameter parent: associated DigitalData.
    init(parent p: DigitalData) {
        parent = p
    }


    /// Returns to the parent object.
    /// - Returns: Parent object
    public func endProduct() -> DigitalData {
        return parent
    }


    /// Provides access to the ProductInfo object.
    ///
    /// ProductInfo describes the product.
    ///
    /// - Returns: the ProductInfo object for this Product
    public func productInfo() -> ProductInfo<Product> {
        if productInformation == nil {
            productInformation = ProductInfo<Product>(parent: self)
        }
        return productInformation
    }


    /// Provides access to the Category object for the Product
    ///
    /// Because of the wide range of methods for categorization, an object
    /// literal is provided for product categories.
    ///
    /// The name primaryCategory is RECOMMENDED if you included only one set of
    /// categories for products, or for your primary set of categories. All other
    /// names are optional and should fit the individual implementation needs in
    /// both naming and values passed.
    ///
    /// - Returns:  Category object for this Product
    public func category() -> Category<Product> {
        if productCategory == nil {
            productCategory = Category<Product>(parent: self)
        }
        return productCategory
    }

    /// Adds a new Linked Product to the list of linked products.
    /// - Returns: a new Linked Product
    public func addLinkedProduct() -> LinkedProduct<Product> {
        if linkedProducts == nil {
            linkedProducts = Array<LinkedProduct<Product>>()
        }
        let linkedProduct = LinkedProduct<Product>(parent: self)
        linkedProducts.append(linkedProduct)
        return linkedProduct
    }


    /// Provides access to the Attributes object for this Product.
    ///
    /// This object provides extensibility to the Product object. Any additional
    /// dimensions related to the product can be provided. All names are optional
    /// and should fit the individual implementation needs in both naming and
    /// values passed.
    ///
    /// - Returns: Attributes object for this Product
    public func attributes() -> DAttributes<Product> {
        if productAttributes == nil {
            productAttributes = DAttributes<Product>(parent: self)
        }
        return productAttributes
    }


    /// Directly adds a new attribute to the Product's attributes
    /// - Parameter name: Name of the attribute
    /// - Parameter value: Value for the attribute
    /// - Returns: The current Product object
    public func addAttribute(_ name: String, value: AnyObject) -> Self {
        if productAttributes == nil {
            productAttributes = DAttributes<Product>(parent: self)
        }
        _ = productAttributes.attribute(name, value: value)
        return self
    }


    /// Directly adds the primary category to the Product's categories
    /// - Parameter primaryCategory: Value for the primary category
    /// - Returns: The current Product object
    public func addPrimaryCategory(_ primaryCategory: String) -> Self {
        if productCategory == nil {
            productCategory = Category<Product>(parent: self)
        }
        _ = productCategory.primaryCategory(primaryCategory)
        return self
    }


    /// Directly adds a custom category to the Product categories
    /// - Parameter name: Name of the category
    /// - Parameter value: Value for the attribute
    /// - Returns: The current Product object
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
