//
//  User.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class User {

    fileprivate var parent: DigitalData
    fileprivate var usersegment: Segment!
    fileprivate var userProfile: Array<UserProfile>!

    init(parent p: DigitalData) {
        parent = p
    }

    public func endUser() -> DigitalData {
        return parent
    }

    public func segment() -> Segment {
        if usersegment == nil {
            usersegment = Segment(parent: self)
        }
        return usersegment
    }

    public func addSegment(name: String, value: String) -> Self {
        if usersegment == nil {
            usersegment = Segment(parent: self)
        }
        let _ = usersegment.segment(name: name, value: value as AnyObject)
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
}
