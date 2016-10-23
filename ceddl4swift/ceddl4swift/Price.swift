//
//  Price.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Price<T>: BaseItem<AnyObject> {

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

    public func basePrice(_ basePrice: NSNumber) -> Self {
        addItem(BASE_PRICE, value: basePrice)
        return self
    }

    public func voucherCode(_ voucherCode: String) -> Self {
        addItem(VOUCHER_CODE, value: voucherCode as AnyObject)
        return self
    }

    public func voucherDiscount(_ voucherDiscount: NSNumber) -> Self {
        addItem(VOUCHER_DISCOUNT, value: voucherDiscount)
        return self
    }

    public func currency(_ currency: String) -> Self {
        addItem(CURRENCY, value: currency as AnyObject)
        return self
    }

    public func taxRate(_ taxRate: NSNumber) -> Self {
        addItem(TAX_RATE, value: taxRate as AnyObject)
        return self
    }

    public func shipping(_ shipping: NSNumber) -> Self {
        addItem(SHIPPING, value: shipping)
        return self
    }

    public func shippingMethod(_ shippingMethod: String) -> Self {
        addItem(SHIPPING_METHOD, value: shippingMethod as AnyObject)
        return self
    }

    public func priceWithTax(_ priceWithTax: NSNumber) -> Self {
        addItem(PRICE_WITH_TAX, value: priceWithTax)
        return self
    }

    public func cartTotal(_ cartTotal: NSNumber) -> Self {
        addItem(CART_TOTAL, value: cartTotal)
        return self
    }

    public func transactionTotal(_ transactionTotal: NSNumber) -> Self {
        addItem(TRANSACTION_TOTAL, value: transactionTotal)
        return self
    }

    override func returnSelf() -> AnyObject {
        return self
    }
}
