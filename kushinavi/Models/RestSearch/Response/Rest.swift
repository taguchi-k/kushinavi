//
//  Rest.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation
import ObjectMapper

struct Rest: Mappable {

    var name = ""
    var station = ""
    var walk = ""
    var address = ""
    var tel = ""
    var budget = ""
    var shopImage1 = ""

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        name       <- map["name"]
        station    <- map["access.station"]
        walk       <- map["access.walk"]
        address    <- map["address"]
        tel        <- map["tel"]
        budget     <- map["budget"]
        shopImage1 <- map["image_url.shop_image1"]
    }
}
