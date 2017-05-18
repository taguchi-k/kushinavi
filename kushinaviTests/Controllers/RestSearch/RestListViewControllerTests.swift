//
//  RestListViewControllerTests.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
import STV_Extensions

@testable import kushinavi

class RestListViewControllerTests: XCTestCase {

    var vc: RestListViewController!

    override func setUp() {
        super.setUp()

        vc = UIStoryboard.viewController(storyboardName: RestListViewController.className,
                                         identifier: RestListViewController.className) as! RestListViewController
        _ = vc.view
    }

    override func tearDown() {
        super.tearDown()
    }

    func testHasTableView() {
        XCTAssertNotNil(vc.tableView)
    }

    func testTableViewSetDataSource() {
        XCTAssertTrue(vc.tableView.dataSource is RestListTableView)
    }

    func testTableViewSetDelegate() {
        XCTAssertTrue(vc.tableView.delegate is RestListViewController)
    }
}
