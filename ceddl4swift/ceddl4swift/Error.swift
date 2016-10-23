//
//  Error.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

enum DigitalDataError: Error {
    case illegalStateException(String)
    case parsingFailed(String)
}
