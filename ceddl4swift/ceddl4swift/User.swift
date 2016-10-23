//
//  User.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class User: NSObject, JSONProtocol {

    fileprivate var parent: DigitalData!

    //MARK: - JSON segment
    fileprivate var userSegment: Segment!

    //MARK: - JSON profile
    fileprivate var userProfile: Array<UserProfile>!

    override init() {
        super.init()
    }

    init(parent p: DigitalData) {
        parent = p
    }

    public func endUser() -> DigitalData {
        return parent
    }

    public func segment() -> Segment {
        if userSegment == nil {
            userSegment = Segment(parent: self)
        }
        return userSegment
    }

    public func addSegment(_ name: String, value: String) -> Self {
        if userSegment == nil {
            userSegment = Segment(parent: self)
        }
        _ = userSegment.segment(name, value: value as AnyObject)
        return self
    }

    public func addProfile() -> UserProfile {
        if userProfile == nil {
            userProfile = Array<UserProfile>()
        }
        let usrProfile = UserProfile(parent: self)
        userProfile.append(usrProfile);
        return usrProfile;
    }

    func getMap() -> Dictionary<String, AnyObject> {
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
