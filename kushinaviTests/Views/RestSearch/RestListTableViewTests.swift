//
//  RestListTableViewTests.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import kushinavi

class RestListTableViewTests: XCTestCase {

    let dataSouce = RestListTableView()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testRestsCount() {
        XCTAssertEqual(dataSouce.rests.count, 0)
    }

    func testAddRestsCount() {

        let result = MocRestSearchResults().feachTestData()
        dataSouce.add(status: .normal(result), rests: result.rests)

        XCTAssertEqual(dataSouce.rests.count, 10)
    }
}
