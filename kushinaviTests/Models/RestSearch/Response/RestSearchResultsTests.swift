//
//  RestSearchResultsTests.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import kushinavi

class RestSearchResultsTests: XCTestCase {

    var result: RestSearchResults?

    override func setUp() {
        super.setUp()
        result = MocRestSearchResults().feachTestData()
    }

    override func tearDown() {
        result = nil
        super.tearDown()
    }

    func testRestSearchResults() {

        XCTAssertEqual(result?.totalHitCount, "3791")
        XCTAssertEqual(result?.hitPerPage, "10")
        XCTAssertEqual(result?.pageOffSet, "1")
        XCTAssertEqual(result?.rests.count, 10)
    }
}
