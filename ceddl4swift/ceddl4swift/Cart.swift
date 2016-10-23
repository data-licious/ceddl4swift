//
//  Cart.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Cart: BaseItem<AnyObject> {

    fileprivate let CART_ID: String = "cartID"
    fileprivate var parent: DigitalData!

    //MARK: - JSON cartID
    fileprivate var cartID: String!

    //MARK: - JSON price
    fileprivate var cartPrice: Price<Cart>!

    //MARK: - JSON attributes
    fileprivate var cartAttributes: DAttributes<Cart>!

    //MARK: - JSON item
    fileprivate var cartItem: Array<Item<Cart>>!

    override init() {
        super.init()
    }

    init(parent p: DigitalData) {
        parent = p
    }

    public func endCart() -> DigitalData {
        return parent
    }

    public func cartID(cartID: String) -> Cart {
        return custom(CART_ID, value: cartID as AnyObject) as! Cart
    }

    public func price() -> Price<Cart> {
        if cartPrice == nil {
            cartPrice =  Price<Cart>(parent: self)
        }
        return cartPrice
    }

    public func attributes() -> DAttributes<Cart> {
        if cartAttributes == nil {
            cartAttributes = DAttributes<Cart>(parent: self)
        }
        return cartAttributes
    }

    public func addAttribute(_ name: String, value: AnyObject) -> Cart {
        if cartAttributes == nil {
            cartAttributes = DAttributes<Cart>(parent: self)
        }
        _ = cartAttributes.attribute(name, value: value)
        return self
    }

    public func addItem() -> Item<Cart> {
        if cartItem == nil {
            cartItem = Array<Item<Cart>>()
        }
        let item = Item<Cart>(parent: self)
        cartItem.append(item)
        return item
    }

    override func returnSelf() -> AnyObject {
        return self
    }

    override func getMap() -> Dictionary<String, AnyObject> {
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
