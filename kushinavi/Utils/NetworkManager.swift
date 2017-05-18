//
//  NetworkManager.swift
//  ios-rakuten-api-demo
//
//  Created by Kushida　Eiji on 2017/02/17.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

import Alamofire

final class NetworkManager {
    
    static func isAvailable() -> Bool{
        
        let net = NetworkReachabilityManager()
        net?.startListening()
        
        if net?.isReachable ?? false {
            return true
            
        } else {
            return false
        }
    }
}
