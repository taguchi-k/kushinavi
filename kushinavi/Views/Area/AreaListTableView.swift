//
//  AreaListTableView.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit
import STV_Extensions

final class AreaListTableView: NSObject {

    var areas = [Area]()

    func add(areas: [Area]) {
        self.areas = areas
    }
}

// MARK: - UITableViewDataSource
extension AreaListTableView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return areas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: AreaListTableViewCell.className) as! AreaListTableViewCell
        cell.area = areas[indexPath.row]

        return cell
    }
}
