//
//  Error.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

///If an error occurs in the framework
enum DigitalDataError: ErrorType {
    /// Illegal_State
    case illegalStateException(String)
    /// JSON Parsing Error
    case parsingFailed(String)
}
