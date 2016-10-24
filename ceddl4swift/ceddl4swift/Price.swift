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


    /// init `Price` object.
    /// - Parameter parent: The parent Object
    init(parent p: T) {
        parent = p
    }


    /// Returns to the parent object.
    /// - Returns: parent object
    public func endPrice() -> T {
        return parent
    }

    /// Sets the basePrice.
    ///
    /// The basePrice SHOULD be the price of the items before applicable
    /// discounts, shipping charges, and tax.
    ///
    /// - Parameter basePrice: NSNumber
    /// - Retunrs: current Object
    public func basePrice(_ basePrice: NSNumber) -> Self {
        addItem(BASE_PRICE, value: basePrice)
        return self
    }


    /// Sets the voucherCode.
    /// - Parameter voucherCode: String
    /// - Returns: current Object
    public func voucherCode(_ voucherCode: String) -> Self {
        addItem(VOUCHER_CODE, value: voucherCode as AnyObject)
        return self
    }


    /// Sets the voucherDiscount.
    /// - Parameter voucherDiscount: NSNumber
    /// - Returns: current Object
    public func voucherDiscount(_ voucherDiscount: NSNumber) -> Self {
        addItem(VOUCHER_DISCOUNT, value: voucherDiscount)
        return self
    }


    /// Sets the currency.
    ///
    /// For currency values, ISO 4217 is RECOMMENDED.
    ///
    /// - Parameter currency: String
    /// - Returns: current Object
    public func currency(_ currency: String) -> Self {
        addItem(CURRENCY, value: currency as AnyObject)
        return self
    }


    /// Sets the taxRate.
    /// - Parameter taxRate: NSNumber
    /// - Returns: current Object
    public func taxRate(_ taxRate: NSNumber) -> Self {
        addItem(TAX_RATE, value: taxRate as AnyObject)
        return self
    }


    /// Sets the taxRate.
    /// - Parameter taxRate: NSNumber
    /// - Returns: current Object
    public func shipping(_ shipping: NSNumber) -> Self {
        addItem(SHIPPING, value: shipping)
        return self
    }


    /// Sets the shippingMethod.
    /// - Parameter shippingMethod: String
    /// - Returns: current Object
    public func shippingMethod(_ shippingMethod: String) -> Self {
        addItem(SHIPPING_METHOD, value: shippingMethod as AnyObject)
        return self
    }


    /// Sets the priceWithTax.
    /// - Parameter priceWithTax: NSNumber
    /// - Returns: current Object
    public func priceWithTax(_ priceWithTax: NSNumber) -> Self {
        addItem(PRICE_WITH_TAX, value: priceWithTax)
        return self
    }


    /// Sets the cartTotal.
    ///
    /// The cartTotal SHOULD be the total price inclusive of all discounts,
    /// charges, and tax.
    ///
    /// - Parameter cartTotal: NSNumber
    /// - Returns: current Object
    public func cartTotal(_ cartTotal: NSNumber) -> Self {
        addItem(CART_TOTAL, value: cartTotal)
        return self
    }


    /// Sets the transactionTotal.
    ///
    /// The transactionTotal SHOULD be the total price inclusive of all
    /// discounts, charges, and tax.
    ///
    /// - Parameter transactionTotal: NSNumber
    /// - Returns: current Object
    public func transactionTotal(_ transactionTotal: NSNumber) -> Self {
        addItem(TRANSACTION_TOTAL, value: transactionTotal)
        return self
    }

    override func returnSelf() -> AnyObject {
        return self
    }
}
