//
//  RestListStatusNoData.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

final class RestListStatusNoData: NSObject, RestListStatusType {

    func message() -> String {
        return "MSG_NODATA".localized()
    }
}
