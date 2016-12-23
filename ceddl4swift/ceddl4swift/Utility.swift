//
//  Utility.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 23/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

/// Standard `Date` to `String` conversion
public let dateToStringFormatter: NSDateFormatter = {
    let dateFormatter = NSDateFormatter()
    let timeZone = NSTimeZone(name: "GMT")
    dateFormatter.timeZone = timeZone
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    return dateFormatter
}()

/// Checking the equality of `Dictionary`
public func ==(lhs: [String: AnyObject], rhs: [String: AnyObject] ) -> Bool {
    return NSDictionary(dictionary: lhs).isEqual(rhs)
}

/// Converting date to `String`
public func dateToString(date: NSDate) -> String {
    return dateToStringFormatter.stringFromDate(date)
}

/// Adding the equality of `Dictionary`
public func + <K,V>(left: Dictionary<K,V>, right: Dictionary<K,V>) -> Dictionary<K,V> {
    var map = Dictionary<K,V>()
    for (k, v) in left {
        map[k] = v
    }
    for (k, v) in right {
        map[k] = v
    }
    return map
}

public class Utility {
    class func loadJSONFromFile(type: Swift.AnyClass, name: String) throws -> Any {
        let filePath = NSBundle(forClass: type).pathForResource(name, ofType: "json")
        let fileURL = NSURL(fileURLWithPath: filePath!)
        let data = NSData(contentsOfURL: fileURL)
        let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(rawValue: 0))
        return json
    }
}
