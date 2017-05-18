//
//  GAreaLargeResult.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation
import ObjectMapper

struct GAreaLargeResult: Mappable {

    var gAreaLarge = [Area]()

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        gAreaLarge <- map["garea_large"]
    }
}
