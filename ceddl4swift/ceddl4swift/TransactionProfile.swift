//
//  TransactionProfile.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class TransactionProfile: NSObject, JSONProtocol {

    fileprivate var parent: Transaction

    //MARK: - JSON profileInfo
    fileprivate var profileInformation: ProfileInfo<TransactionProfile>!

    //MARK: - JSON address
    fileprivate var transactionAddress: Address<TransactionProfile>!

    //MARK: - JSON shippingAddress
    fileprivate var transactionShippingAddress: Address<TransactionProfile>!

    init(parent p: Transaction) {
        parent = p
    }

    public func endProfile() -> Transaction {
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

    func getMap() -> Dictionary<String, AnyObject> {
        var dictionary = Dictionary<String, AnyObject>()
        if profileInformation != nil {
            dictionary["profileInfo"] = profileInformation.getMap() as AnyObject
        }
        if transactionAddress != nil {
            dictionary["address"] = transactionAddress.getMap() as AnyObject
        }
        if transactionShippingAddress != nil {
            dictionary["shippingAddress"] = transactionShippingAddress.getMap() as AnyObject
        }
        return dictionary
    }
}
