//
//  UserProfile.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class UserProfile: NSObject, JSONProtocol {

    fileprivate var parent: User

    //MARK: - JSON profileInfo
    fileprivate var profileInformation: ProfileInfo<UserProfile>!

    //MARK: - JSON address
    fileprivate var userAddress: Address<UserProfile>!

    //MARK: - JSON socail
    fileprivate var userSocial: Social!

    //MARK: - JSON attributes
    fileprivate var userAttributes: DAttributes<UserProfile>!

    init(parent p: User) {
        parent = p
    }

    public func endProfile() -> User {
        return parent
    }

    public func profileInfo() -> ProfileInfo<UserProfile> {
        if profileInformation == nil {
            profileInformation = ProfileInfo<UserProfile>(parent: self)
        }
        return profileInformation
    }

    public func address() -> Address<UserProfile> {
        if userAddress == nil {
            userAddress = Address<UserProfile>(parent: self)
        }
        return userAddress
    }

    public func social() -> Social {
        if userSocial == nil {
            userSocial = Social(parent: self)
        }
        return userSocial
    }

    public func addSocial(_ name: String, value: String) -> UserProfile {
        if userSocial == nil {
            userSocial = Social(parent: self)
        }
        _ = userSocial.social(name, value: value as AnyObject)
        return self
    }

    public func attributes() -> DAttributes<UserProfile> {
        if userAttributes == nil {
            userAttributes = DAttributes<UserProfile>(parent: self)
        }
        return userAttributes
    }

    public func addAttribute(_ name: String, value: String) -> UserProfile {
        if userAttributes == nil {
            userAttributes = DAttributes<UserProfile>(parent: self)
        }
        _ = userAttributes.attribute(name, value: value as AnyObject)
        return self
    }

    func getMap() -> Dictionary<String, AnyObject> {
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
