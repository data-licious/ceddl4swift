//
//  CustomObject.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 21/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class CustomObject: BaseItem<CustomObject> {
    override func returnSelf() -> CustomObject {
        return self
    }
}
