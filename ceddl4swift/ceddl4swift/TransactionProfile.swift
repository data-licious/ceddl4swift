//
//  TransactionProfile.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class TransactionProfile: NSObject, JSONProtocol {

    private var parent: Transaction

    //JSON id - profileInfo
    private var profileInformation: ProfileInfo<TransactionProfile>!

    //JSON id - address
    private var transactionAddress: Address<TransactionProfile>!

    //JSON id - shippingAddress
    private var transactionShippingAddress: Address<TransactionProfile>!


    /// init an TransactionProfile object.
    /// - Parameter parent: The parent Object
    public init(parent p: Transaction) {
        parent = p
    }


    /// Returns to the parent Transaction object.
    /// - Returns: parent Transaction object
    public func endProfile() -> Transaction {
        return parent
    }


    /// Provides access to the ProfileInfo object
    ///
    ///An extensible object for providing information about the purchaser.
    ///
    /// - Retunrs: the ProfileInfo object for this Profile
    public func profileInfo() -> ProfileInfo<TransactionProfile> {
        if profileInformation == nil {
            profileInformation = ProfileInfo<TransactionProfile>(parent: self)
        }
        return profileInformation
    }


    /// Provides access to the Address object.
    ///
    /// An extensible object for providing (billing) address information for the
    /// purchaser.
    ///
    /// - Retunrs: The Address object for this Profile
    public func address() -> Address<TransactionProfile> {
        if transactionAddress == nil {
            transactionAddress = Address<TransactionProfile>(parent: self)
        }
        return transactionAddress
    }


    /// Provides access to the Shipping Address object.
    ///
    /// An extensible object for providing shipping address information for the
    /// purchaser.
    ///
    /// - Retunrs: The Shipping Address for this Profile
    public func shippingAddress() -> Address<TransactionProfile> {
        if transactionShippingAddress == nil {
            transactionShippingAddress = Address<TransactionProfile>(parent: self)
        }
        return transactionShippingAddress
    }

    public func getMap() -> Dictionary<String, AnyObject> {
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
