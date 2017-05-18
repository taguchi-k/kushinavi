//
//  Area.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation
import ObjectMapper

struct Area: Mappable {

    var areaCodeL = ""
    var areaNameL = ""
    var prefCode = ""
    var prefName = ""

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        areaCodeL <- map["areacode_l"]
        areaNameL <- map["areaname_l"]
        prefCode  <- map["pref.pref_code"]
        prefName  <- map["pref.pref_name"]
    }
}
