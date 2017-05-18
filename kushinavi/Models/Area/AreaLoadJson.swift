//
//  AreaLoadJson.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation
import STV_Extensions
import ObjectMapper

final class AreaLoadJson {

    var loadable: AreaLoadable?

    static private let prefCodeTokyo = "PREF13"

    func load(fileName: String) {

        let json = Bundle.loadJson(fileName: fileName)

        if let result = Mapper<GAreaLargeResult>().map(JSONString: json) {

            let tokyoAreas = createTokyoResult(result: result)
            loadable?.setStatus(status: createStatus(tokyoAreas: tokyoAreas))
        }
    }

    private func createStatus(tokyoAreas: [Area]) -> AreaLoadStatus {

        return tokyoAreas.count > 0 ? .normal(tokyoAreas) : .noData
    }

    private func createTokyoResult(result: GAreaLargeResult) -> [Area] {

        return result.gAreaLarge.filter { $0.prefCode == AreaLoadJson.prefCodeTokyo }
    }
}
