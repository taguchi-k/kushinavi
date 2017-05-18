//
//  RestListFactory.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

final class RestListFactory: NSObject {

    private var viewType: RestListStatusType?

    func setStatus(status: RestListStatus) {
        switch status {
        case .none:
            viewType = RestListStatusNone()
        case .normal:
            viewType = RestListStatusNormal()
        case .noData:
            viewType = RestListStatusNoData()
        case .offline:
            viewType = RestListStatusOffline()
        case .error:
            viewType = RestListStatusError()
        }
    }

    func create(tableView: UITableView,
                indexPath: IndexPath,
                rests: [Rest]) -> UITableViewCell {

        return viewType?.create(tableView: tableView,
                                indexPath: indexPath,
                                rests: rests) ?? UITableViewCell()
    }

    func numberOfRowsInSection(rests: [Rest]) -> Int {
        return viewType?.numberOfRowsInSection(rests: rests) ?? 0
    }

    func message() -> String {
        return viewType?.message() ?? ""
    }
}
