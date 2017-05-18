//
//  AreaListTableViewCell.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

final class AreaListTableViewCell: UITableViewCell {

    @IBOutlet weak var areaLabel: UILabel!

    var area: Area? {
        didSet {
            areaLabel.text = area?.areaNameL
        }
    }
}
