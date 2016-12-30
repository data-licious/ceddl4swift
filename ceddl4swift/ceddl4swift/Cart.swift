//
//  Cart.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

///
/// The Cart object carries details about a shopping cart or basket and the
/// products that have been added to it. The Cart object is intended for a
/// purchase that has not yet been completed. See the Transaction object for
/// completed orders.
///

open class Cart: BaseItem<AnyObject> {

    fileprivate let CART_ID: String = "cartID"
    fileprivate var parent: DigitalData!

    //JSON id - cartID
    fileprivate var cartID: String!

    //JSON id - price
    fileprivate var cartPrice: Price<Cart>!

    //JSON id - attributes
    fileprivate var cartAttributes: DAttributes<Cart>!

    //JSON id - item
    fileprivate var cartItem: Array<Item<Cart>>!


    /// init `Cart` object.
    public override init() {
        super.init()
    }


    /// init `Cart` object.
    /// - Parameter parent: associated DigitalData.
    public init(parent p: DigitalData) {
        parent = p
    }


    ///  returns to the parent object.
    /// - Returns: DigitalData
    open func endCart() -> DigitalData {
        return parent
    }


    ///  Set the cartID
    /// - Parameter cartID: An identifier for a particular shopping cart.
    /// - Returns: The current Cart Object.
    open func cartID(_ cartID: String) -> Cart {
        return custom(CART_ID, value: cartID as AnyObject) as! Cart
    }


    /// Provides access to the Price object.
    ///
    /// This object provides details of the cart price. The basePrice SHOULD be
    /// the price of the items before applicable discounts, shipping charges, and
    /// tax. The cartTotal SHOULD be the total price inclusive of all discounts,
    /// charges, and tax.
    ///
    /// - Returns: The Price object for the current Cart
    open func price() -> Price<Cart> {
        if cartPrice == nil {
            cartPrice =  Price<Cart>(parent: self)
        }
        return cartPrice
    }


    /// Provides access to the Attributes object for this Cart.
    ///
    /// This object provides extensibility to the cart as a whole. Any additional
    /// dimensions related to the cart can be provided. All names are optional
    /// and should fit the individual implementation needs in both naming and
    /// values passed.
    ///
    /// - Returns: Attributes object for this Cart
    open func attributes() -> DAttributes<Cart> {
        if cartAttributes == nil {
            cartAttributes = DAttributes<Cart>(parent: self)
        }
        return cartAttributes
    }


    /// Directly adds a new attribute to the Cart's attributes
    /// - Parameter name: Name of the attribute
    /// - Parameter value: Value for the attribute
    /// - Returns: The current Cart object
    open func addAttribute(_ name: String, value: AnyObject) -> Cart {
        if cartAttributes == nil {
            cartAttributes = DAttributes<Cart>(parent: self)
        }
        _ = cartAttributes.attribute(name, value: value)
        return self
    }


    /// Adds a new item to the list of items in the Cart.
    /// - Returns: A new Item object
    open func addItem() -> Item<Cart> {
        if cartItem == nil {
            cartItem = Array<Item<Cart>>()
        }
        let item = Item<Cart>(parent: self)
        cartItem.append(item)
        return item
    }

    open override func returnSelf() -> AnyObject {
        return self
    }

    open override func getMap() -> Dictionary<String, AnyObject> {
        var dictionary = Dictionary<String, AnyObject>()
        dictionary = super.getMap()
        if cartID != nil {
            dictionary["cartID"] = cartID as AnyObject
        }
        if cartPrice != nil {
            dictionary["price"] = cartPrice.getMap() as AnyObject
        }
        if cartAttributes != nil {
            dictionary["attributes"] = cartAttributes.getMap() as AnyObject
        }
        if cartItem != nil {
            var cartItemDictionary = Array<Dictionary<String, AnyObject>>()
            for item in cartItem {
                cartItemDictionary.append(item.getMap())
            }
            dictionary["item"] = cartItemDictionary as AnyObject
        }
        return dictionary
    }
}
