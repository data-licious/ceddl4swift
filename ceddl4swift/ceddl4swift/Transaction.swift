//
//  Transaction.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Transaction: BaseItem<Transaction> {

    fileprivate let TRANSACTION_ID = "transactionID"
    fileprivate var parent: DigitalData
    fileprivate var transactionProfile: TransactionProfile!
    fileprivate var transactionTotal: Price<Transaction>!
    fileprivate var transactionAttributes: DAttributes<Transaction>!
    fileprivate var transactionItem: Array<Item<Transaction>>!

    init(parent p: DigitalData) {
        parent = p
    }

    public func endTransaction() -> DigitalData {
        return parent
    }

    public func transactionID(transactionID: String) -> Transaction {
        return custom(name: TRANSACTION_ID, value: transactionID as AnyObject)
    }

    public func profile() -> TransactionProfile {
        if transactionProfile == nil {
            transactionProfile = TransactionProfile(parent: self)
        }
        return transactionProfile
    }

    public func total() -> Price<Transaction> {
        if transactionTotal == nil {
            transactionTotal = Price<Transaction>(parent: self)
        }
        return transactionTotal;
    }

    public func attributes() -> DAttributes<Transaction> {
        if transactionAttributes == nil {
            transactionAttributes = DAttributes<Transaction>(parent: self)
        }
        return transactionAttributes
    }

    public func addAttribute(name: String, value: AnyObject) -> Self {
        if transactionAttributes == nil {
            transactionAttributes = DAttributes<Transaction>(parent: self)
        }
        let _ = transactionAttributes.attribute(name: name, value: value)
        return self
    }

    public func addItem() -> Item<Transaction> {
        if transactionItem == nil {
            transactionItem = Array<Item<Transaction>>()
        }
        let item = Item<Transaction>(parent: self)
        transactionItem.append(item)
        return item
    }
    
    override func returnSelf() -> Transaction {
        return self
    }
}
