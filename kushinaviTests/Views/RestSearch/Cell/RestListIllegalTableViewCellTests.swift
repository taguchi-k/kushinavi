//
//  RestListIllegalTableViewCellTests.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import kushinavi

class RestListIllegalTableViewCellTests: XCTestCase {

    var tableView: UITableView?
    let dataSouce = FakeDataSource()
    var cell: RestListIllegalTableViewCell?
    var result: RestSearchResults?

    override func setUp() {
        super.setUp()

        let controller = MocRestListViewController()
            .create(identifier: RestListViewController.className) as! RestListViewController

        tableView = controller.tableView
        tableView?.dataSource = dataSouce

        cell = tableView?.dequeueReusableCell(
            withIdentifier: RestListIllegalTableViewCell.className) as? RestListIllegalTableViewCell
    }

    override func tearDown() {
        super.tearDown()
    }

    func testHasMessageLabel() {
        XCTAssertNotNil(cell?.messageLabel)
    }

    func testSetMessage() {
        cell?.message = "テスト"
        XCTAssertEqual(cell?.messageLabel.text!, "テスト")
    }
}

extension RestListIllegalTableViewCellTests {

    final class FakeDataSource: NSObject, UITableViewDataSource {

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
