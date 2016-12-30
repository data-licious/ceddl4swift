//
//  UserProfile.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

open class UserProfile: NSObject, JSONProtocol {

    fileprivate var parent: User

    //JSON id - profileInfo
    fileprivate var profileInformation: ProfileInfo<UserProfile>!

    //JSON id - address
    fileprivate var userAddress: Address<UserProfile>!

    //JSON id - socail
    fileprivate var userSocial: Social!

    //JSON id - attributes
    fileprivate var userAttributes: DAttributes<UserProfile>!


    /// init an UserProfile object.
    /// - Parameter parent: The parent Object
    public init(parent p: User) {
        parent = p
    }


    /// Returns to the parent Event object.
    /// - Returns: parent Event object
    open func endProfile() -> User {
        return parent
    }


    /// Provides access to the ProfileInfo object for the user profile.
    ///
    /// An extensible object for providing information about the user.
    ///
    /// - Retunrs: ProfileInfo object for the Profile
    open func profileInfo() -> ProfileInfo<UserProfile> {
        if profileInformation == nil {
            profileInformation = ProfileInfo<UserProfile>(parent: self)
        }
        return profileInformation
    }


    /// Provides access to the address information object for the user profile.
    ///
    /// An extensible object for providing address information for the user.
    ///
    /// - Retunrs: Address object for the Profile
    open func address() -> Address<UserProfile> {
        if userAddress == nil {
            userAddress = Address<UserProfile>(parent: self)
        }
        return userAddress
    }


    /// Provides access to the social information object for the user profile.
    ///
    /// An extensible object for providing address information for the user.
    ///
    /// - Retunrs: Social object for the Profile
    open func social() -> Social {
        if userSocial == nil {
            userSocial = Social(parent: self)
        }
        return userSocial
    }


    /// Directly adds new social information to the Profile.
    /// - Parameter name: Name of the social information
    /// - Parameter value: Value for the social information
    /// - Returns: current UserProfile.
    open func addSocial(_ name: String, value: String) -> UserProfile {
        if userSocial == nil {
            userSocial = Social(parent: self)
        }
        _ = userSocial.social(name, value: value as AnyObject)
        return self
    }


    /// Provides access to the attributes object for the user profile.
    ///
    /// This object provides extensibility to the profile.
    ///
    /// - Retunrs: Attributes object for the Profile
    open func attributes() -> DAttributes<UserProfile> {
        if userAttributes == nil {
            userAttributes = DAttributes<UserProfile>(parent: self)
        }
        return userAttributes
    }


    /// Directly adds a new attribute to the Profile's Attributes
    /// - Parameter name: Name of the attribute
    /// - Parameter value: Value for the attribute
    /// - Returns: current UserProfile.
    open func addAttribute(_ name: String, value: String) -> UserProfile {
        if userAttributes == nil {
            userAttributes = DAttributes<UserProfile>(parent: self)
        }
        _ = userAttributes.attribute(name, value: value as AnyObject)
        return self
    }

    open func getMap() -> Dictionary<String, AnyObject> {
        var dictionary = Dictionary<String, AnyObject>()
        if profileInformation != nil {
            dictionary["profileInfo"] = profileInformation.getMap() as AnyObject
        }
        if userAddress != nil {
            dictionary["address"] = userAddress.getMap() as AnyObject
        }
        if userSocial != nil {
            dictionary["social"] = userSocial.getMap() as AnyObject
        }
        if userAttributes != nil {
            dictionary["attributes"] = userAttributes.getMap() as AnyObject
        }
        return dictionary
    }
}
