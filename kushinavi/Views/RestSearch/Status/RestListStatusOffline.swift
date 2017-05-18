//
//  RestListStatusOffline.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

final class RestListStatusOffline: NSObject, RestListStatusType {

    func message() -> String {
        return "MSG_OFFLINE".localized()
    }
}
