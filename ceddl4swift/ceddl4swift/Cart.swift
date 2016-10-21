//
//  Cart.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Cart: BaseItem<Cart> {

    fileprivate let CART_ID: String = "cartID"
    fileprivate var parent: DigitalData
    fileprivate var cartID: String!
    fileprivate var cartPrice: Price<Cart>!
    fileprivate var cartAttributes: DAttributes<Cart>!
    fileprivate var cartItem: Array<Item<Cart>>!

    init(parent p: DigitalData) {
        parent = p
    }

    public func endCart() -> DigitalData {
        return parent
    }

    public func cartID(cartID: String) -> Cart {
        return custom(name: CART_ID, value: cartID as AnyObject)
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

    public func addAttribuut(name: String, value: AnyObject) -> Cart {
    if cartAttributes == nil {
        cartAttributes = DAttributes<Cart>(parent: self)
    }
        let _ = cartAttributes.attribute(name: name, value: value)
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

    override func returnSelf() -> Cart {
        return self
    }
}
