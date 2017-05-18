//
//  AreaListViewController.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation

import UIKit
import STV_Extensions

final class AreaListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let areaLoadJson = AreaLoadJson()
    fileprivate let dataSource = AreaListTableView()
    fileprivate var areaLoadStatus = AreaLoadStatus.none

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadJson()
    }

    // MARK: - Private
    private func setup() {

        hideBackButtonText()
        tableView.dataSource = dataSource
        areaLoadJson.loadable = self
    }

    private func loadJson() {
        areaLoadJson.load(fileName: Constants.Json.areaJsonName)
    }
}

// MARK: - UITableViewDelegate
extension AreaListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)

        let restListViewController =
            UIStoryboard.viewController(storyboardName: RestListViewController.className,
                                        identifier: RestListViewController.className) as! RestListViewController
        restListViewController.areaCodeL = dataSource.areas[indexPath.row].areaCodeL
        restListViewController.areaNameL = dataSource.areas[indexPath.row].areaNameL

        navigationController?.pushViewController(restListViewController, animated: true)
    }
}

// MARK: - AreaLoadable
extension AreaListViewController: AreaLoadable {

    func setStatus(status: AreaLoadStatus) {

        areaLoadStatus = status

        switch status {
        case .normal(let tokyoAreas):
            updateAreaList(tokyoAreas: tokyoAreas)

        default:
            fatalError("Jsonファイルが不正です")
        }
    }

    private func updateAreaList(tokyoAreas: [Area]) {
        
        dataSource.add(areas: tokyoAreas)
        tableView.reloadData()
    }
}
