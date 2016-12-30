//
//  CustomObject.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

open class CustomObject: BaseItem<AnyObject> {
    open override func returnSelf() -> AnyObject {
        return self
    }
}
