//
//  Item.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Item<T>: BaseItem<AnyObject> {
    fileprivate let QUANTITY = "quantity"
    fileprivate var parent: T

    //MARK: - JSON productInfo
    fileprivate var productInformation: ProductInfo<Item<T>>!

    //MARK: - JSON category
    fileprivate var itemCategory: Category<Item<T>>!

    //MARK: - JSON price
    fileprivate var itemPrice: Price<Item<T>>!

    //MARK: - JSON linkedProducts
    fileprivate var linkedProducts: Array<LinkedProduct<Item<T>>>!

    //MARK: - JSON attributes
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

    public func quantity(_ quantity: NSNumber) -> Item<T> {
        addItem(QUANTITY, value: quantity)
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

    public func addAttribuut(_ name: String, value: AnyObject) -> Self {
        if itemAttributes == nil {
            itemAttributes = DAttributes<Item<T>>(parent: self)
        }
        _ = itemAttributes.attribute(name, value: value)
        return self
    }

    public func addPrimaryCategory(_ primaryCategory: String) -> Self {
        if itemCategory == nil {
            itemCategory = Category<Item<T>>(parent: self)
        }
        _ = itemCategory.primaryCategory(primaryCategory)
        return self;
    }

    public func addCategory(_ name: String, value: AnyObject) -> Item<T> {
        if itemCategory == nil {
            itemCategory = Category<Item<T>>(parent: self)
        }
        _ = itemCategory.category(name, value: value)
        return self
    }
    
    override func returnSelf() -> AnyObject {
        return self
    }

    override func getMap() -> Dictionary<String, AnyObject> {
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
