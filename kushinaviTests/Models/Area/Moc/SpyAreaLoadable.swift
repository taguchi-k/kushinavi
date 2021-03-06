//
//  SpyAreaLoadable.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import kushinavi

final class SpyAreaLoadable: AreaLoadable {

    var status: AreaLoadStatus?
    var asyncExpectation: XCTestExpectation?

    func setStatus(status: AreaLoadStatus) {

        guard let expectation = asyncExpectation else {
            XCTFail("Delegateが正しく設定されていない")
            return
        }

        self.status = status
        expectation.fulfill()
    }
}
