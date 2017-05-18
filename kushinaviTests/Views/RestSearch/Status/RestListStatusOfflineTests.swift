//
//  RestListStatusOfflineTests.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import kushinavi

class RestListStatusOfflineTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testRestListStatusOffline() {

        let factory = RestListFactory()
        factory.setStatus(status: .offline)

        XCTAssertEqual(factory.numberOfRowsInSection(rests: []), 1)
        XCTAssertEqual(factory.message(), "ネットワーク環境の良い環境で再度お試しください。")
    }
}
