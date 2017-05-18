//
//  RestListStatusNormalTests.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import kushinavi

class RestListStatusNormalTests: XCTestCase {

    var result: RestSearchResults?

    override func setUp() {
        super.setUp()
        result = MocRestSearchResults().feachTestData()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testRestListStatusNormal() {

        if let result = result {

            let rests = result.rests
            let factory = RestListFactory()
            factory.setStatus(status: .normal(result))

            XCTAssertEqual(factory.numberOfRowsInSection(rests: rests), 10)
        }
    }
}
