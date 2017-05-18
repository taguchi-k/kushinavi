//
//  AreaLoadJsonTests.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import kushinavi

class AreaLoadJsonTests: XCTestCase {

    let loadJson = AreaLoadJson()
    let loadable = SpyAreaLoadable()

    override func setUp() {
        super.setUp()
        loadJson.loadable = loadable
    }

    override func tearDown() {
        loadJson.loadable = nil
        super.tearDown()
    }

    func testAreaLoadJson() {

        let exp = expectation(description: "JSONを読み込めているかのテスト")
        loadable.asyncExpectation = exp

        loadJson.load(fileName: Constants.Json.areaJsonName)

        waitForExpectations(timeout: 3) { (error) in
            if let error = error {
                XCTFail("waitForExpectationsエラー: \(error)")
            }

            if let status = self.loadable.status {

                switch status {
                case .normal(let result) :
                    XCTAssertNotNil(result)
                    XCTAssertTrue(result.count > 0)

                default:
                    XCTFail("バグです")
                }
            }
        }
    }
}
