//
//  RestSearchResults.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import ObjectMapper

struct RestSearchResults: Mappable {

    var totalHitCount = ""
    var hitPerPage = ""
    var pageOffSet = ""
    var rests = [Rest]()

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        totalHitCount <- map["total_hit_count"]
        hitPerPage    <- map["hit_per_page"]
        pageOffSet    <- map["page_offset"]
        rests         <- map["rest"]
    }
}
