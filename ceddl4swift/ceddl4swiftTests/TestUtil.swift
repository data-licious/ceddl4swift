//
//  TestUtil.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 23/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class TestUtililty {
    class func loadJSONFromFile(_ type: Swift.AnyClass, name: String) throws -> Any {
        let filePath = Bundle(for: type).path(forResource: name, ofType: "json")
        let fileURL = URL(fileURLWithPath: filePath!)
        let data = try Data(contentsOf: fileURL)
        let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: 0))
        return json
    }
}
