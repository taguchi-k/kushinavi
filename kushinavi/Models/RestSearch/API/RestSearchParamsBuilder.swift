//
//  RestSearchParamsBuilder.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Keys

struct RestSearchParamsBuilder {

    static let keyId = KushinaviKeys().restSearchAPIKyeId
    static let format = "json"
    static let hitPerPage = 50

    static func create(areaCodeL: String, offSetPage: Int) -> [String: Any] {

        return [
            "keyid" : keyId,
            "format" : format,
            "areacode_l" : areaCodeL,
            "hit_per_page" : hitPerPage,
            "offset_page": offSetPage
        ]
    }
}
