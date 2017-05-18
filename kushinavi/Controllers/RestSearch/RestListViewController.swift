//
//  RestListViewController.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit
import STV_Extensions
import SVProgressHUD

class RestListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var areaCodeL = ""
    var areaNameL = ""

    fileprivate let restSearchAPI = RestSearchAPI()
    fileprivate let dataSource = RestListTableView()
    fileprivate var restListStatus = RestListStatus.none

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        SVProgressHUD.dismiss()
    }

    // MARK: - Private
    private func setup() {

        title = String(format: "TITLE_REST_DEFAULT".localized(), areaNameL)
        tableView.dataSource = dataSource
        resetRestList(status: .none)
        SVProgressHUD.setDefaultStyle(.dark)
        loadRestSearch(areaCodeL: areaCodeL)
    }

    fileprivate func resetRestList(status: RestListStatus) {

        restSearchAPI.reset()
        dataSource.add(status: status, rests: [])
        tableView.reloadData()
    }

    private func loadRestSearch(areaCodeL: String) {

        SVProgressHUD.show(withStatus: "MSG_LOADING".localized())
        self.areaCodeL = areaCodeL
        restSearchAPI.loadable = self
        restSearchAPI.load(areaCodeL: areaCodeL)
    }
}

// MARK: - UIScrollViewDelegate
extension RestListViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        if scrollView.isScrollEnd() &&
            restSearchAPI.isMoreRequest() &&
            !restSearchAPI.waiting() {

            nextLoadRestList()
        }
    }

    private func nextLoadRestList() {

        SVProgressHUD.show(withStatus: "MSG_LOADING".localized())
        restSearchAPI.increment()
        restSearchAPI.load(areaCodeL: areaCodeL)
    }
}

// MARK: - UITableViewDelegate
extension RestListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        let cellHeight: CGFloat

        switch restListStatus {
        case .normal:
            cellHeight = restListStatus.cellHeight
        default:
            cellHeight = restListStatus.cellHeight - (navigationController?.height ?? 0)
        }

        return cellHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - RestSearchLoadable
extension RestListViewController: RestSearchLoadable {

    func setStatus(status: RestListStatus) {

        restListStatus = status

        switch status {
        case .normal(let result):
            updateRestList(result: result)

        default:
            resetRestList(status: status)
        }

        SVProgressHUD.dismiss()
    }

    private func updateRestList(result: RestSearchResults?) {
        if
            let result = result,
            let totalHitCount = Int(result.totalHitCount) {

            restSearchAPI.updateTotal(total: totalHitCount)
            dataSource.append(status: restListStatus, rests: result.rests)
            title = String(format: "TITLE_REST".localized(),
                           areaNameL, totalHitCount.decimalStr)
        }
        
        tableView.reloadData()
    }
}
