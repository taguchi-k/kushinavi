//
//  RestSearchParamsBuilderTests.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
import Keys

@testable import kushinavi

class RestSearchParamsBuilderTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testRestSearchParamsBuilder() {

        let params = RestSearchParamsBuilder.create(areaCodeL: "AREAL2101", offSetPage: 1)

        XCTAssertEqual(params["keyid"] as? String, KushinaviKeys().restSearchAPIKyeId)
        XCTAssertEqual(params["format"] as? String, "json")
        XCTAssertEqual(params["areacode_l"] as? String, "AREAL2101")
        XCTAssertEqual(params["hit_per_page"] as? Int, 50)
        XCTAssertEqual(params["offset_page"] as? Int, 1)
    }
}
