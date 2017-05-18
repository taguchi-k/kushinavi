//
//  RestSearchAPITests.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import kushinavi

class RestSearchAPITests: XCTestCase {

    let api = RestSearchAPI()
    let loadable = SpyRestSearchLoadable()

    override func setUp() {
        super.setUp()
        api.loadable = loadable
    }

    override func tearDown() {
        api.loadable = nil
        super.tearDown()
    }

    func testSearchAreaCodeLAREAL2101() {

        let exp = expectation(description: "「AREAL2101」で検索したときのテスト")
        loadable.asyncExpectation = exp

        api.load(areaCodeL: "AREAL2101")

        waitForExpectations(timeout: 3) { (error) in
            if let error = error {
                XCTFail("waitForExpectationsエラー: \(error)")
            }

            if let status = self.loadable.status {

                switch status {
                case .normal(let result) :
                    XCTAssertNotNil(result)
                    XCTAssertTrue(result.rests.count > 0)
                    XCTAssertEqual(result.pageOffSet, "1")

                case .error(let error) :
                    XCTFail(error.localizedDescription)

                default:
                    XCTFail("バグです")
                }
            }
        }
    }

    func testSearchAreaCodeNoData() {

        let exp = expectation(description: "該当データがないときのテスト")
        loadable.asyncExpectation = exp

        api.load(areaCodeL: "ARあああEAL2101")

        waitForExpectations(timeout: 3) { error in
            if let error = error {
                XCTFail("waitForExpectationsエラー: \(error)")
            }

            if let status = self.loadable.status {
                switch status {
                case .noData:
                    XCTAssertTrue(true)

                case .error(let error) :
                    XCTFail(error.localizedDescription)
                    
                default:
                    XCTFail("バグです")
                }
            }
        }
    }
}
