//
//  Transaction.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Transaction: BaseItem<AnyObject> {

    private let TRANSACTION_ID = "transactionID"
    private var parent: DigitalData!

    //JSON id - profile
    private var transactionProfile: TransactionProfile!

    //JSON id - total
    private var transactionTotal: Price<Transaction>!

    //JSON id - attributes
    private var transactionAttributes: DAttributes<Transaction>!

    //JSON id - item
    private var transactionItem: Array<Item<Transaction>>!


    /// init `Transaction` object.
    public override init() {
        super.init()
    }


    /// init `Transaction` object.
    /// - Parameter parent: associated DigitalData.
    public init(parent p: DigitalData) {
        parent = p
    }


    /// Returns to the parent object.
    /// - Returns: Parent object
    public func endTransaction() -> DigitalData {
        return parent
    }


    ///	Sets the transactionID
    /// - Parameter transactionID:
    ///           A unique identifier for a particular transaction; usually an existing order identifier.
    /// - Returns: current Transaction
    public func transactionID(_ transactionID: String) -> Transaction {
        return custom(TRANSACTION_ID, value: transactionID as AnyObject) as! Transaction
    }


    /// Provides access to the Profile object for this Transaction.
    ///
    /// A profile for information about the purchaser, typically associated with
    /// a registered user.
    ///
    /// - Returns: Profile Object for this Transaction
    public func profile() -> TransactionProfile {
        if transactionProfile == nil {
            transactionProfile = TransactionProfile(parent: self)
        }
        return transactionProfile
    }


    /// Provides access to the Total (Price) object for this Transaction.
    ///
    /// This object provides details of the final price the purchaser has to pay.
    /// The basePrice SHOULD be the price of the items before applicable
    /// discounts, shipping charges, and tax. The transactionTotal SHOULD be the
    /// total price inclusive of all discounts, charges, and tax.
    ///
    /// - Returns: The Total (Price) object for this Transaction.
    public func total() -> Price<Transaction> {
        if transactionTotal == nil {
            transactionTotal = Price<Transaction>(parent: self)
        }
        return transactionTotal;
    }


    /// Provides access to the Attributes object for this Transaction.
    ///
    /// This object provides extensibility to the transaction as a whole. Any
    /// additional dimensions related to the cart can be provided. All names are
    /// optional and should fit the individual implementation needs in both
    /// naming and values passed.
    ///
    /// - Returns: Attributes object for this Transaction
    public func attributes() -> DAttributes<Transaction> {
        if transactionAttributes == nil {
            transactionAttributes = DAttributes<Transaction>(parent: self)
        }
        return transactionAttributes
    }


    /// Directly adds a new attribute to the Transaction's attributes
    /// - Parameter name: Name of the attribute
    /// - Parameter value: Value for the attribute
    /// - Returns: current Transaction object.
    public func addAttribute(_ name: String, value: AnyObject) -> Self {
        if transactionAttributes == nil {
            transactionAttributes = DAttributes<Transaction>(parent: self)
        }
        _ = transactionAttributes.attribute(name, value: value)
        return self
    }


    /// Adds a new Item to the list of items in the transaction.
    /// - Returns: a new Item in the transaction
    public func addItem() -> Item<Transaction> {
        if transactionItem == nil {
            transactionItem = Array<Item<Transaction>>()
        }
        let item = Item<Transaction>(parent: self)
        transactionItem.append(item)
        return item
    }
    
    public override func returnSelf() -> AnyObject {
        return self
    }

    public override func getMap() -> Dictionary<String, AnyObject> {
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
