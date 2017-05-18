//
//  RestListStatusNormal.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

final class RestListStatusNormal: RestListStatusType {

    func create(tableView: UITableView,
                indexPath: IndexPath,
                rests: [Rest]) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier:
            RestListTableViewCell.className) as! RestListTableViewCell
        cell.rest = rests[indexPath.row]

        return cell
    }

    func numberOfRowsInSection(rests: [Rest]) -> Int {
        return rests.count
    }

    func message() -> String {
        fatalError("ありえないパターンです")
    }
}
