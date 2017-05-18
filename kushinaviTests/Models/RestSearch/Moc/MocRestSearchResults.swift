//
//  MocRestSearchResults.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
import Foundation
import ObjectMapper

@testable import kushinavi

final class MocRestSearchResults {

    func feachTestData() -> RestSearchResults {

        let bundle = Bundle(for: type(of: self))

        if let path = bundle.path(forResource: "rest_search", ofType: "json"),
            let fileHandle = FileHandle(forReadingAtPath: path),
            let json = String(data: fileHandle.readDataToEndOfFile(), encoding: String.Encoding.utf8),
            let searchResult = Mapper<RestSearchResults>().map(JSONString: json) {

            return searchResult
        }

        fatalError("テストデータが読み込めない")
    }
}
