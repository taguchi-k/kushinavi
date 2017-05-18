//
//  RestListStatus.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import STV_Extensions

enum RestListStatus {
    case none
    case noData
    case normal(RestSearchResults)
    case offline
    case error(Error)

    static private let normalCellHeight: CGFloat = 180

    var cellHeight: CGFloat {
        switch self {
        case .normal:
            return RestListStatus.normalCellHeight
        default:
            return UIScreen().screenHeight
        }
    }
}
