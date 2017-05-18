//
//  MocGAreaLargeResult.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
import Foundation
import STV_Extensions
import ObjectMapper

@testable import kushinavi

final class MocGAreaLargeResult {

    static func feachTestData() -> GAreaLargeResult {

        let json = Bundle.loadJson(fileName: Constants.Json.areaJsonName)

        if let result = Mapper<GAreaLargeResult>().map(JSONString: json) {

            return result
        }

        fatalError("テストデータが読み込めない")
    }
}
