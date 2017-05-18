//
//  RestListIllegalTableViewCell.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

class RestListIllegalTableViewCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!

    var message = "" {
        didSet {
            messageLabel.text = message
        }
    }
}
