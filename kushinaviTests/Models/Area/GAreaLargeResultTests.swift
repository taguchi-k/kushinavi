//
//  GAreaLargeResultTests.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import kushinavi

class GAreaLargeResultTests: XCTestCase {

    var result: GAreaLargeResult?

    override func setUp() {
        super.setUp()
        result = MocGAreaLargeResult.feachTestData()
    }

    override func tearDown() {
        result = nil
        super.tearDown()
    }

    func testGAreaLargeResult() {

        XCTAssertTrue((result?.gAreaLarge.count)! > 0)
        XCTAssertEqual(result?.gAreaLarge.count, 437)
    }
}

