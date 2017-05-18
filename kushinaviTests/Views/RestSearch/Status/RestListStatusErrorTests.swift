//
//  RestListStatusErrorTests.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import kushinavi

class RestListStatusErrorTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testRestListStatusNone() {

        let factory = RestListFactory()
        factory.setStatus(status: .error(NSError() as Error))

        XCTAssertEqual(factory.numberOfRowsInSection(rests: []), 1)
        XCTAssertEqual(factory.message(), "エラーが発生しました。\n時間を空けて再度お試しください。")
    }
}
