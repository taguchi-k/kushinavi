//
//  NetworkManagerTest.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import kushinavi

class NetworkManagerTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    //オンラインのときのみ
    func testIsAvailable() {
        let result = NetworkManager.isAvailable()
        XCTAssertTrue(result)
    }
}
