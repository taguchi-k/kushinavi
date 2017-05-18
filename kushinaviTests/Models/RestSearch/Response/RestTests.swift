//
//  RestTests.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import kushinavi

class RestTests: XCTestCase {

    var result: RestSearchResults?

    override func setUp() {
        super.setUp()
        result = MocRestSearchResults().feachTestData()
    }

    override func tearDown() {
        result = nil
        super.tearDown()
    }

    func testRest() {

        let rest = result?.rests.first

        XCTAssertEqual(rest?.name, "有楽町 個室居酒屋 赤鶏御殿 有楽町駅前店")
        XCTAssertEqual(rest?.station, "日比谷駅")
        XCTAssertEqual(rest?.walk, "2")
        XCTAssertEqual(rest?.address, "〒100-0006 東京都千代田区有楽町1-2-11 オーキッドスクエア3F")
        XCTAssertEqual(rest?.tel, "03-3503-0510")
        XCTAssertEqual(rest?.budget, "3000")
        XCTAssertEqual(rest?.shopImage1, "https://uds.gnst.jp/rest/img/p3ezkecu0000/t_00fe.jpg")
    }
}
