//
//  MocRestListViewController.swift
//  kushinavi
//
//  Created by Kentaro on 2017/04/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
import UIKit
import STV_Extensions

@testable import kushinavi

final class MocRestListViewController: NSObject {

    var controller: UIViewController?

    func create(identifier: String) -> UIViewController {

        controller = UIStoryboard
            .viewController(storyboardName: RestListViewController.className,
                            identifier: RestListViewController.className) as! RestListViewController
        _ = controller?.view

        return controller!
    }
}
