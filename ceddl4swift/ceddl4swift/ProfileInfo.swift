//
//  ProfileInfo.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

open class ProfileInfo<T>: BaseItem<AnyObject> {

    fileprivate let PROFILE_ID = "profileID"
    fileprivate let USER_NAME = "userName"
    fileprivate let EMAIL = "email"
    fileprivate let LANGUAGE = "language"
    fileprivate let RETURNING_STATUS = "returningStatus"
    fileprivate let TYPE = "type"

    fileprivate var parent: T


    /// init an ProfileInfo object.
    /// - Parameter parent: The parent Object
    public init(parent p: T) {
        parent = p
    }


    /// Returns to the parent object.
    /// - Returns: parent object
    open func endProfileInfo() -> T {
        return parent
    }


    /// Sets the profileID.
    /// - Parameter profileID: String
    /// - Returns: current Object
    open func profileID(_ profileID: String) -> Self {
        addItem(PROFILE_ID, value: profileID as AnyObject)
        return self
    }


    /// Sets the userName.
    /// - Parameter userName: String
    /// - Returns: current Object
    open func userName(_ userName: String) -> Self {
        addItem(USER_NAME, value: userName as AnyObject)
        return self
    }


    /// Sets the email.
    /// - Parameter email: String
    /// - Returns: current Object
    open func email(_ email: String) -> Self {
        addItem(EMAIL, value: email as AnyObject)
        return self
    }


    /// Sets the language.
    /// - Parameter language: String
    /// - Returns: current Object
    open func language(_ language: String) -> Self {
        addItem(LANGUAGE, value: language as AnyObject)
        return self
    }


    /// Sets the returningStatus.
    /// - Parameter returningStatus: String
    /// - Returns: current Object
    open func returningStatus(_ returningStatus: String) ->  Self {
        addItem(RETURNING_STATUS, value: returningStatus as AnyObject)
        return self
    }


    /// Sets the type.
    /// - Parameter type: String
    /// - Returns: current Object
    open func type(_ type: String) -> Self {
        addItem(TYPE, value: type as AnyObject)
        return self
    }

    open override func returnSelf() -> AnyObject {
        return self
    }
}
