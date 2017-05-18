
//
//  RestListTableView.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit
import STV_Extensions

final class RestListTableView: NSObject {

    var rests = [Rest]()
    fileprivate let factory = RestListFactory()
    private var status: RestListStatus? {
        didSet {
            if let status = status {
                factory.setStatus(status: status)
            }
        }
    }

    func add(status: RestListStatus, rests: [Rest]) {
        self.status = status
        self.rests = rests
    }

    func append(status: RestListStatus, rests: [Rest]) {
        self.status = status
        self.rests += rests
    }
}

// MARK: - UITableViewDataSource
extension RestListTableView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return factory.numberOfRowsInSection(rests: rests)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        return factory.create(tableView: tableView, indexPath: indexPath, rests: rests)
    }
}
