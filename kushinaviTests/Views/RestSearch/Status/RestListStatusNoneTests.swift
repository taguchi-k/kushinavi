//
//  RestListStatusNoneTests.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import kushinavi

class RestListStatusNoneTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testRestListStatusNone() {

        let factory = RestListFactory()
        factory.setStatus(status: .none)

        XCTAssertEqual(factory.numberOfRowsInSection(rests: []), 1)
        XCTAssertEqual(factory.message(), "")
    }
}
