//
//  RouterTest.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import kushinavi

class RouterTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testBaseURL() {

        XCTAssertEqual(Router.baseURLString, "https://api.gnavi.co.jp/")
    }

    func testURLRequest() {

        let router = Router.restSearch(["format":"json","keyid":"e1810be0bba33050499e5410dcffbe6d"])
        let urlRequest = try! router.asURLRequest()
        XCTAssertEqual(urlRequest.description, "https://api.gnavi.co.jp/RestSearchAPI/20150630/?format=json&keyid=e1810be0bba33050499e5410dcffbe6d")
    }
}

