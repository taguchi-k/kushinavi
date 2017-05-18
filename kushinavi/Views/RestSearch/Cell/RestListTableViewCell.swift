//
//  RestListTableViewCell.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit
import STV_Extensions
import Kingfisher

final class RestListTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabele: UILabel!
    @IBOutlet weak var accessLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var shopImageView: UIImageView!

    var rest: Rest? {
        didSet {
            guard
                let rest = rest,
                let walkInt = Int(rest.walk),
                let budgetInt = Int(rest.budget) else { return }

            nameLabele.text = rest.name
            accessLabel.text = String(format: "CELL_REST_ACCESS".localized(),
                                      rest.station, walkInt.decimalStr)
            addressLabel.text = rest.address
            telLabel.text = rest.tel
            budgetLabel.text = String(format: "CELL_REST_BUDGET".localized(),
                                      budgetInt.decimalStr)
            imageURL = rest.shopImage1
        }
    }

    private var imageURL = "" {
        didSet {
            let url = URL(string: imageURL)
            shopImageView.kf.setImage(with: url,
                                      placeholder: #imageLiteral(resourceName: "no_image"),
                                      options: [.transition(ImageTransition.fade(1)), .keepCurrentImageWhileLoading],
                                      progressBlock: nil,
                                      completionHandler: nil)
        }
    }

    override func prepareForReuse() {
        shopImageView.image = nil
    }
}
