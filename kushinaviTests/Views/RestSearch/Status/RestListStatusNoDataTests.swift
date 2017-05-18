//
//  RestListStatusNoDataTests.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import kushinavi

class RestListStatusNoDataTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testRestListStatusNoData() {

        let factory = RestListFactory()
        factory.setStatus(status: .noData)

        XCTAssertEqual(factory.numberOfRowsInSection(rests: []), 1)
        XCTAssertEqual(factory.message(), "該当する飲食店がありません。\nエリアを変更してお試しください。")
    }
}
