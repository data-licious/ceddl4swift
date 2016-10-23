//
//  JSONProtocol.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 22/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

@objc protocol JSONProtocol {
    func getMap() -> Dictionary<String, AnyObject>
}
