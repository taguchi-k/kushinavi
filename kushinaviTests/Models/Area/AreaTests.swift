//
//  AreaTests.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import kushinavi

class AreaTests: XCTestCase {

    var result: GAreaLargeResult?

    override func setUp() {
        super.setUp()
        result = MocGAreaLargeResult.feachTestData()
    }

    override func tearDown() {
        result = nil
        super.tearDown()
    }

    func testArea() {

        let area = result?.gAreaLarge.first

        XCTAssertEqual(area?.areaCodeL, "AREAL5500")
        XCTAssertEqual(area?.areaNameL, "札幌駅・大通・すすきの")
        XCTAssertEqual(area?.prefCode, "PREF01")
        XCTAssertEqual(area?.prefName, "北海道")
    }
}
