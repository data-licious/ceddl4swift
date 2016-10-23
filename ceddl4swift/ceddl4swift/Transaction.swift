//
//  Transaction.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Transaction: BaseItem<AnyObject> {

    fileprivate let TRANSACTION_ID = "transactionID"
    fileprivate var parent: DigitalData!

    //MARK: - JSON profile
    fileprivate var transactionProfile: TransactionProfile!

    //MARK: - JSON total
    fileprivate var transactionTotal: Price<Transaction>!

    //MARK: - JSON attributes
    fileprivate var transactionAttributes: DAttributes<Transaction>!

    //MARK: - JSON item
    fileprivate var transactionItem: Array<Item<Transaction>>!

    override init() {
        super.init()
    }

    init(parent p: DigitalData) {
        parent = p
    }

    public func endTransaction() -> DigitalData {
        return parent
    }

    public func transactionID(_ transactionID: String) -> Transaction {
        return custom(TRANSACTION_ID, value: transactionID as AnyObject) as! Transaction
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

    public func addAttribute(_ name: String, value: AnyObject) -> Self {
        if transactionAttributes == nil {
            transactionAttributes = DAttributes<Transaction>(parent: self)
        }
        _ = transactionAttributes.attribute(name, value: value)
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
    
    override func returnSelf() -> AnyObject {
        return self
    }

    override func getMap() -> Dictionary<String, AnyObject> {
        var dictionary = Dictionary<String, AnyObject>()
        dictionary = super.getMap()
        if transactionProfile != nil {
            dictionary["profile"] = transactionProfile.getMap() as AnyObject
        }
        if transactionTotal != nil {
            dictionary["total"] = transactionTotal.getMap() as AnyObject
        }
        if transactionAttributes != nil {
            dictionary["attributes"] = transactionAttributes.getMap() as AnyObject
        }
        if transactionItem != nil {
            var transactionItemDictionary = Array<Dictionary<String, AnyObject>>()
            for item in transactionItem {
                transactionItemDictionary.append(item.getMap())
            }
            dictionary["item"] = transactionItemDictionary as AnyObject
        }
        return dictionary
    }
}
