//
//  Item.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

open class Item<T>: BaseItem<AnyObject> {
    fileprivate let QUANTITY = "quantity"
    fileprivate var parent: T

    //JSON id - productInfo
    fileprivate var productInformation: ProductInfo<Item<T>>!

    //JSON id - category
    fileprivate var itemCategory: Category<Item<T>>!

    //JSON id - price
    fileprivate var itemPrice: Price<Item<T>>!

    //JSON id - linkedProducts
    fileprivate var linkedProducts: Array<LinkedProduct<Item<T>>>!

    //JSON id - attributes
    fileprivate var itemAttributes: DAttributes<Item<T>>!


    /// init an Item object.
    /// - Parameter parent: The parent Object
    public init(parent p: T) {
        parent = p
    }


    /// Returns to the parent object.
    /// - Returns: parent object
    open func endItem() -> T {
        return parent
    }


    /// Provides access to the Item's ProductInfo object.
    ///
    /// This object describes the product.
    ///
    /// - Returns: ProductInfo object for this Item
    open func productInfo() -> ProductInfo<Item<T>> {
        if productInformation == nil {
            productInformation = ProductInfo<Item<T>>(parent: self)
        }
        return productInformation
    }


    /// Provides access to the Item's category object.
    ///
    /// Because of the wide range of methods for categorization, an object
    /// literal is provided for product categories.
    ///
    /// - Returns: Category Object for this Item
    open func category() -> Category<Item<T>> {
        if itemCategory == nil {
            itemCategory = Category<Item<T>>(parent: self)
        }
        return itemCategory
    }


    /// Sets the quantity of this particular item in the cart or transaction.
    /// - Returns: current object
    open func quantity(_ quantity: NSNumber) -> Item<T> {
        addItem(QUANTITY, value: quantity)
        return self
    }


    /// Provides access to the Item's price object.
    /// - Returns: Price object for the Item
    open func price() -> Price<Item<T>> {
        if itemPrice == nil {
            itemPrice = Price<Item<T>>(parent: self)
        }
        return itemPrice;
    }


    /// Adds a new linked product to this Item.
    /// - Returns: new LinkedProduct object for the Item
    open func addLinkedProduct() -> LinkedProduct<Item<T>> {
        if linkedProducts == nil {
            linkedProducts = Array<LinkedProduct<Item<T>>>();
        }
        let linkedProduct = LinkedProduct<Item<T>>(parent: self)
        linkedProducts.append(linkedProduct);

        return linkedProduct;
    }


    /// Provides access to the attributes object.
    /// - Returns: Attributes object for this Item
    open func attributes() -> DAttributes<Item<T>> {
        if itemAttributes == nil {
            itemAttributes = DAttributes<Item<T>>(parent: self)
        }
        return itemAttributes;
    }


    /// Directly adds a new attribute to the Item's attributes
    /// - Parameter name: Name of the attribute
    /// - Parameter value: Value for the attribute
    /// - Returns: current Item.
    open func addAttribuut(_ name: String, value: AnyObject) -> Self {
        if itemAttributes == nil {
            itemAttributes = DAttributes<Item<T>>(parent: self)
        }
        _ = itemAttributes.attribute(name, value: value)
        return self
    }


    /// Directly adds a new attribute to the Item's categories
    /// - Parameter primaryCategory: Value for the primary category
    /// - Returns: current oject.
    open func addPrimaryCategory(_ primaryCategory: String) -> Self {
        if itemCategory == nil {
            itemCategory = Category<Item<T>>(parent: self)
        }
        _ = itemCategory.primaryCategory(primaryCategory)
        return self;
    }


    /// Directly adds a custom category to the Page categories
    /// - Parameter name: Name of the attribute
    /// - Parameter value: Value for the attribute
    /// - Returns: current object.
    open func addCategory(_ name: String, value: AnyObject) -> Item<T> {
        if itemCategory == nil {
            itemCategory = Category<Item<T>>(parent: self)
        }
        _ = itemCategory.category(name, value: value)
        return self
    }
    
    open override func returnSelf() -> AnyObject {
        return self
    }

    open override func getMap() -> Dictionary<String, AnyObject> {
        var dictionary = Dictionary<String, AnyObject>()
        dictionary = super.getMap()
        if productInformation != nil {
            dictionary["productInfo"] = productInformation.getMap() as AnyObject
        }
        if itemCategory != nil {
            dictionary["category"] = itemCategory.getMap() as AnyObject
        }
        if itemPrice != nil {
            dictionary["price"] = itemPrice.getMap() as AnyObject
        }
        if linkedProducts != nil {
            var linkedProductsDictionary = Array<Dictionary<String, AnyObject>>()
            for linkedProduct in linkedProducts {
                linkedProductsDictionary.append(linkedProduct.getMap())
            }
            dictionary["linkedProducts"] = linkedProductsDictionary as AnyObject
        }
        if itemAttributes != nil {
            dictionary["attributes"] = itemAttributes.getMap() as AnyObject
        }
        return dictionary
    }
}
