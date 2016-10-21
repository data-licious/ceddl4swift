//
//  ProfileInfo.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class ProfileInfo<T>: BaseItem<ProfileInfo> {

    fileprivate let PROFILE_ID = "profileID"
    fileprivate let USER_NAME = "userName"
    fileprivate let EMAIL = "email"
    fileprivate let LANGUAGE = "language"
    fileprivate let RETURNING_STATUS = "returningStatus"
    fileprivate let TYPE = "type"

    fileprivate var parent: T

    init(parent p: T) {
        parent = p
    }

    public func endProfileInfo() -> T {
        return parent
    }

    public func profileID(profileID: String) -> Self {
        addItem(field: PROFILE_ID, value: profileID as AnyObject)
        return self
    }

    public func userName(userName: String) -> Self {
        addItem(field: USER_NAME, value: userName as AnyObject)
        return self
    }

    public func email(email: String) -> Self {
        addItem(field: EMAIL, value: email as AnyObject)
        return self
    }

    public func language(language: String) -> Self {
        addItem(field: LANGUAGE, value: language as AnyObject)
        return self
    }

    public func returningStatus(returningStatus: String) ->  Self {
        addItem(field: RETURNING_STATUS, value: returningStatus as AnyObject)
        return self
    }

    public func type(type: String) -> Self {
        addItem(field: TYPE, value: type as AnyObject)
        return self
    }

    override func returnSelf() -> ProfileInfo<T> {
        return self
    }
}
