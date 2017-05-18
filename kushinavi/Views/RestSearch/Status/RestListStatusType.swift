//
//  RestListStatusType.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit
import STV_Extensions

protocol RestListStatusType {

    func create(tableView: UITableView,
                indexPath: IndexPath,
                rests: [Rest]) -> UITableViewCell
    func numberOfRowsInSection(rests: [Rest]) -> Int
    func message() -> String
}

extension RestListStatusType where Self: NSObject {

    func create(tableView: UITableView,
                indexPath: IndexPath,
                rests: [Rest]) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: RestListIllegalTableViewCell.className) as! RestListIllegalTableViewCell
        cell.message = message()

        return cell
    }

    func numberOfRowsInSection(rests: [Rest]) -> Int {
        return 1
    }
}
