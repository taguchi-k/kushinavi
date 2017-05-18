//
//  AreaListTableViewTests.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import kushinavi

class AreaListTableViewTests: XCTestCase {

    let dataSouce = AreaListTableView()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testAreasCount() {
        XCTAssertEqual(dataSouce.areas.count, 0)
    }

    func testAddAreasCount() {

        let result = MocGAreaLargeResult.feachTestData()
        dataSouce.add(areas: result.gAreaLarge)

        XCTAssertEqual(dataSouce.areas.count, 437)
    }
}
