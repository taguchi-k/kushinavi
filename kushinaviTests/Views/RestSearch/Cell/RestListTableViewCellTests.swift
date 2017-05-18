//
//  RestListTableViewCellTests.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import kushinavi

class RestListTableViewCellTests: XCTestCase {

    var tableView: UITableView?
    let dataSouce = FakeDataSource()
    var cell: RestListTableViewCell?
    var result: RestSearchResults?

    override func setUp() {
        super.setUp()

        let controller = MocRestListViewController()
            .create(identifier: RestListViewController.className) as! RestListViewController

        tableView = controller.tableView
        tableView?.dataSource = dataSouce

        cell = tableView?.dequeueReusableCell(
            withIdentifier: RestListTableViewCell.className) as? RestListTableViewCell
    }

    override func tearDown() {
        super.tearDown()
    }

    func testHasNameLabel() {
        XCTAssertNotNil(cell?.nameLabele)
    }

    func testHasAccessLabel() {
        XCTAssertNotNil(cell?.accessLabel)
    }

    func testHasAddressLabel() {
        XCTAssertNotNil(cell?.addressLabel)
    }

    func testHasTelLabel() {
        XCTAssertNotNil(cell?.telLabel)
    }

    func testHasBudgetLabel() {
        XCTAssertNotNil(cell?.budgetLabel)
    }

    func testHasShopImageView() {
        XCTAssertNotNil(cell?.shopImageView)
    }

    func testConfigCell() {

        result = MocRestSearchResults().feachTestData()
        let rest = result?.rests.first
        cell?.rest = rest

        XCTAssertEqual(cell?.nameLabele.text, "有楽町 個室居酒屋 赤鶏御殿 有楽町駅前店")
        XCTAssertEqual(cell?.accessLabel.text, "日比谷駅 2分")
        XCTAssertEqual(cell?.addressLabel.text, "〒100-0006 東京都千代田区有楽町1-2-11 オーキッドスクエア3F")
        XCTAssertEqual(cell?.telLabel.text, "03-3503-0510")
        XCTAssertEqual(cell?.budgetLabel.text, "¥3,000")
        XCTAssertNil(cell?.shopImageView.image)
    }
}

extension RestListTableViewCellTests {

    final class FakeDataSource: NSObject, UITableViewDataSource {

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
