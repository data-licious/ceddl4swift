//
//  UserProfile.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class UserProfile {

    fileprivate var parent: User
    fileprivate var profileInformation: ProfileInfo<UserProfile>!
    fileprivate var userAddress: Address<UserProfile>!
    fileprivate var userSocial: Social!
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

    public func addSocial(name: String, value: String) -> UserProfile {
        if userSocial == nil {
            userSocial = Social(parent: self)
        }
        let _ = userSocial.social(name: name, value: value as AnyObject)
        return self
    }

    public func attributes() -> DAttributes<UserProfile> {
        if userAttributes == nil {
            userAttributes = DAttributes<UserProfile>(parent: self)
        }
        return userAttributes
    }

    public func addAttribute(name: String, value: String) -> UserProfile {
        if userAttributes == nil {
            userAttributes = DAttributes<UserProfile>(parent: self)
        }
        let _ = userAttributes.attribute(name: name, value: value as AnyObject)
        return self
    }
}
