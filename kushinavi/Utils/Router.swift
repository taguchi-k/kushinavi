//
//  Router.swift
//  ios-rakuten-api-demo
//
//  Created by Kushida　Eiji on 2017/02/17.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

import Alamofire

enum Router: URLRequestConvertible {

    static let baseURLString = "https://api.gnavi.co.jp/"

    case restSearch([String: Any])

    func asURLRequest() throws -> URLRequest {

        let (method, path, parameters): (HTTPMethod, String, [String: Any]) = {

            switch self {
            case .restSearch(let params):
                return (.get, "RestSearchAPI/20150630/", params)
            }
        }()

        if let url = URL(string: Router.baseURLString) {
            var urlRequest = URLRequest(url: url.appendingPathComponent(path))
            urlRequest.httpMethod = method.rawValue
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: parameters)
        } else {
            fatalError("URLがnil")
        }
    }
}
