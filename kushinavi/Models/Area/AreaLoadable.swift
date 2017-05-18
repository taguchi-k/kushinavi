//
//  AreaLoadable.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation

enum AreaLoadStatus{
    case none
    case normal([Area])
    case noData
}

protocol AreaLoadable {
    func setStatus(status: AreaLoadStatus)
}
