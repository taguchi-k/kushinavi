//
//  AreaListTableViewCellTests.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import kushinavi

class AreaListTableViewCellTests: XCTestCase {

    var tableView: UITableView?
    let dataSouce = FakeDataSource()
    var cell: AreaListTableViewCell?
    var result: GAreaLargeResult?

    override func setUp() {
        super.setUp()

        let controller = MocAreaListViewController()
            .create(identifier: AreaListViewController.className) as! AreaListViewController

        tableView = controller.tableView
        tableView?.dataSource = dataSouce

        cell = tableView?.dequeueReusableCell(
            withIdentifier: AreaListTableViewCell.className) as? AreaListTableViewCell
    }

    override func tearDown() {
        super.tearDown()
    }

    func testHasAreaLabel() {
        XCTAssertNotNil(cell?.areaLabel)
    }

    func testConfigCell() {

        result = MocGAreaLargeResult.feachTestData()
        let area = result?.gAreaLarge.first
        cell?.area = area

        XCTAssertEqual(cell?.areaLabel.text, "札幌駅・大通・すすきの")
    }
}

extension AreaListTableViewCellTests {

    final class FakeDataSource: NSObject, UITableViewDataSource {

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
