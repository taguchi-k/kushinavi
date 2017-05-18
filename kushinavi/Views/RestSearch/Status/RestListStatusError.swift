//
//  RestListStatusError.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

class RestListStatusError: NSObject, RestListStatusType {

    func message() -> String {
        return "MSG_ERROR".localized()
    }
}
