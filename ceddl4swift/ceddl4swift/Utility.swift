//
//  Utility.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 23/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

/// Standard `Date` to `String` conversion
public let dateToStringFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    let timeZone = TimeZone(identifier: "GMT")
    dateFormatter.timeZone = timeZone
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    return dateFormatter
}()

/// Checking the equality of `Dictionary`
public func ==(lhs: [String: AnyObject], rhs: [String: AnyObject] ) -> Bool {
    return NSDictionary(dictionary: lhs).isEqual(to: rhs)
}

/// Converting date to `String`
public func dateToString(date: Date) -> String {
    return dateToStringFormatter.string(from: date)
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
    class func loadJSONFromFile(_ type: Swift.AnyClass, name: String) throws -> Any {
        let filePath = Bundle(for: type).path(forResource: name, ofType: "json")
        let fileURL = URL(fileURLWithPath: filePath!)
        let data = try Data(contentsOf: fileURL)
        let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: 0))
        return json
    }
}
