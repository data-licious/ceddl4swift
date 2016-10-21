//
//  Item.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Item<T>: BaseItem<Item> {
    fileprivate let QUANTITY = "quantity"
    fileprivate var parent: T
    fileprivate var productInformation: ProductInfo<Item<T>>!
    fileprivate var itemCategory: Category<Item<T>>!
    fileprivate var itemPrice: Price<Item<T>>!
    fileprivate var linkedProducts: Array<LinkedProduct<Item<T>>>!
    fileprivate var itemAttributes: DAttributes<Item<T>>!

    init(parent p: T) {
        parent = p
    }

    public func endItem() -> T {
        return parent
    }

    public func productInfo() -> ProductInfo<Item<T>> {
        if productInformation == nil {
            productInformation = ProductInfo<Item<T>>(parent: self)
        }
        return productInformation
    }

    public func category() -> Category<Item<T>> {
        if itemCategory == nil {
            itemCategory = Category<Item<T>>(parent: self)
        }
        return itemCategory
    }

    public func quantity(quantity: NSNumber) -> Item<T> {
        addItem(field: QUANTITY, value: quantity)
        return self
    }

    public func price() -> Price<Item<T>> {
        if itemPrice == nil {
            itemPrice = Price<Item<T>>(parent: self)
        }
        return itemPrice;
    }

    public func addLinkedProduct() -> LinkedProduct<Item<T>> {
        if linkedProducts == nil {
            linkedProducts = Array<LinkedProduct<Item<T>>>();
        }
        let linkedProduct = LinkedProduct<Item<T>>(parent: self)
        linkedProducts.append(linkedProduct);

        return linkedProduct;
    }

    public func attributes() -> DAttributes<Item<T>> {
        if itemAttributes == nil {
            itemAttributes = DAttributes<Item<T>>(parent: self)
        }
        return itemAttributes;
    }

    public func addAttribuut(name: String, value: AnyObject) -> Self {
        if itemAttributes == nil {
            itemAttributes = DAttributes<Item<T>>(parent: self)
        }
        let _ = itemAttributes.attribute(name: name, value: value)
        return self
    }

    public func addPrimaryCategory(primaryCategory: String) -> Self {
        if itemCategory == nil {
            itemCategory = Category<Item<T>>(parent: self)
        }
        let _ = itemCategory.primaryCategory(primaryCategory: primaryCategory)
        return self;
    }

    public func addCategory(name: String, value: AnyObject) -> Item<T> {
        if itemCategory == nil {
            itemCategory = Category<Item<T>>(parent: self)
        }
        let _ = itemCategory.category(name: name, value: value)
        return self
    }
    
    override func returnSelf() -> Item<T> {
        return self
    }
    
}
