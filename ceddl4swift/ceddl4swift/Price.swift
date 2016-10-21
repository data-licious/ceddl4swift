//
//  Price.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Price<T>: BaseItem<Price> {

    private let BASE_PRICE = "basePrice"
    private let VOUCHER_CODE = "voucherCode"
    private let VOUCHER_DISCOUNT = "voucherDiscount"
    private let CURRENCY = "currency"
    private let TAX_RATE = "taxRate"
    private let SHIPPING = "shipping"
    private let SHIPPING_METHOD = "shippingMethod"
    private let PRICE_WITH_TAX = "priceWithTax"
    private let CART_TOTAL = "cartTotal"
    private let TRANSACTION_TOTAL = "transactionTotal"

    private var parent: T

    init(parent p: T) {
        parent = p
    }

    public func endPrice() -> T {
        return parent
    }

    public func basePrice(basePrice: NSNumber) -> Self {
        addItem(field: BASE_PRICE, value: basePrice)
        return self
    }

    public func voucherCode(voucherCode: String) -> Self {
        addItem(field: VOUCHER_CODE, value: voucherCode as AnyObject)
        return self
    }

    public func voucherDiscount(voucherDiscount: NSNumber) -> Self {
        addItem(field: VOUCHER_DISCOUNT, value: voucherDiscount)
        return self
    }

    public func currency(currency: String) -> Self {
        addItem(field: CURRENCY, value: currency as AnyObject)
        return self
    }

    public func taxRate(taxRate: NSNumber) -> Self {
        addItem(field: CURRENCY, value: taxRate as AnyObject)
        return self
    }

    public func shipping(shipping: NSNumber) -> Self {
        addItem(field: SHIPPING, value: shipping)
        return self
    }

    public func shippingMethod(shippingMethod: String) -> Self {
        addItem(field: SHIPPING_METHOD, value: shippingMethod as AnyObject)
        return self
    }

    public func priceWithTax(priceWithTax: NSNumber) -> Self {
        addItem(field: PRICE_WITH_TAX, value: priceWithTax)
        return self
    }

    public func cartTotal(cartTotal: NSNumber) -> Self {
        addItem(field: CART_TOTAL, value: cartTotal)
        return self
    }

    public func transactionTotal(transactionTotal: NSNumber) -> Self {
        addItem(field: TRANSACTION_TOTAL, value: transactionTotal)
        return self
    }

    override func returnSelf() -> Price<T> {
        return self
    }
}
