//
//  TransactionProfile.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class TransactionProfile {
    fileprivate var parent: Transaction
    fileprivate var profileInformation: ProfileInfo<TransactionProfile>!
    fileprivate var transactionAddress: Address<TransactionProfile>!
    fileprivate var transactionShippingAddress: Address<TransactionProfile>!

    init(parent p: Transaction) {
        parent = p
    }

    public func endTransactionProfile() -> Transaction {
        return parent
    }

    public func profileInfo() -> ProfileInfo<TransactionProfile> {
        if profileInformation == nil {
            profileInformation = ProfileInfo<TransactionProfile>(parent: self)
        }
        return profileInformation
    }

    public func address() -> Address<TransactionProfile> {
        if transactionAddress == nil {
            transactionAddress = Address<TransactionProfile>(parent: self)
        }
        return transactionAddress
    }

    public func shippingAddress() -> Address<TransactionProfile> {
        if transactionShippingAddress == nil {
            transactionShippingAddress = Address<TransactionProfile>(parent: self)
        }
        return transactionShippingAddress
    }
}
