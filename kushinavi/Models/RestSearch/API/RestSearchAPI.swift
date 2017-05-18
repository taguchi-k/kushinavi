//
//  RestSearchAPI.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation
import ObjectMapper

final class RestSearchAPI {

    var loadable: RestSearchLoadable?
    fileprivate var isLoading = false
    private var requestCount = 1
    private var totalCount = 1

    func waiting() -> Bool {
        return isLoading
    }

    func load(areaCodeL: String) {

        guard NetworkManager.isAvailable() else {
            self.loadable?.setStatus(status: .offline)
            return
        }

        isLoading = true

        let router = Router.restSearch(
            RestSearchParamsBuilder.create(areaCodeL: areaCodeL, offSetPage: current())
        )

        APIClient().request(router: router) { [weak self] (response) in

            switch response {

            case .success(let result):

                if let searchResult = Mapper<RestSearchResults>().map(JSONObject: result) {
                    let status = self?.hasRestList(result: searchResult) ?? .none
                    self?.loadable?.setStatus(status: status)
                }

            case .failure(let error):
                self?.loadable?.setStatus(status: .error(error))
            }

            self?.isLoading = false
        }
    }

    private func hasRestList(result: RestSearchResults) -> RestListStatus {
        return (result.rests.count == 0) ? RestListStatus.noData : RestListStatus.normal(result)
    }

    //MARK:- リクエスト回数の管理
    func current() -> Int {
        return requestCount
    }

    func reset() {
        requestCount = 1
    }

    func increment() {
        requestCount += 1
    }

    func updateTotal(total: Int) {
        self.totalCount = total
    }
    
    func isMoreRequest() -> Bool{
        return totalCount > requestCount * RestSearchParamsBuilder.hitPerPage
    }
}
