//
//  User.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class User: NSObject, JSONProtocol {

    private var parent: DigitalData!

    //JSON id - segment
    private var userSegment: Segment!

    //JSON id - profile
    private var userProfile: Array<UserProfile>!


    /// init `Event` object.
    public override init() {
        super.init()
    }


    /// init `User` object.
    /// - Parameter parent: associated DigitalData.
    public init(parent p: DigitalData) {
        parent = p
    }


    /// Returns to the parent object.
    /// - Returns: Parent object
    public func endUser() -> DigitalData {
        return parent
    }


    /// Provides access to the segment object.
    ///
    /// This object provides population segmentation information for the user,
    /// such as premium versus basic membership, or any other forms of
    /// segmentation that are desirable. Any additional dimensions related to the
    /// user can be provided. All names are optional and should fit the
    /// individual implementation needs in both naming and values passed.
    ///
    /// - Returns: Attributes object
    public func segment() -> Segment {
        if userSegment == nil {
            userSegment = Segment(parent: self)
        }
        return userSegment
    }


    /// Directly adds a new segment to the Profile.
    /// - Parameter name: Name of the segment
    /// - Parameter value: Value for the segment
    /// - Returns: current User object.
    public func addSegment(name: String, value: String) -> Self {
        if userSegment == nil {
            userSegment = Segment(parent: self)
        }
        _ = userSegment.segment(name, value: value as AnyObject)
        return self
    }


    /// Adds a new profile for the user.
    ///
    /// A profile for information about the user, typically associated with a
    /// registered user. (Although typically a user might have only a single
    /// profile, this object is an array and can capture multiple profiles per
    /// user.)
    ///
    /// - Returns: a new (User)Profile object
    public func addProfile() -> UserProfile {
        if userProfile == nil {
            userProfile = Array<UserProfile>()
        }
        let usrProfile = UserProfile(parent: self)
        userProfile.append(usrProfile);
        return usrProfile;
    }

    public func getMap() -> Dictionary<String, AnyObject> {
        var dictionary = Dictionary<String, AnyObject>()
        if userSegment != nil {
            dictionary["segment"] = userSegment.getMap() as AnyObject
        }
        if userProfile != nil {
            var userProfileDictionary = Array<Dictionary<String, AnyObject>>()
            for userPro in userProfile {
                userProfileDictionary.append(userPro.getMap())
            }
            dictionary["profile"] = userProfileDictionary as AnyObject
        }
        return dictionary
    }
}
