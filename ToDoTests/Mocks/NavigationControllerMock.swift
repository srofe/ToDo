//
//  NavigationControllerMock.swift
//  ToDoTests
//
//  Created by Simon Rofe on 16/9/2022.
//

import UIKit

class NavigationControllerMock: UINavigationController {
    var lastPushedViewController: UIViewController?

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        lastPushedViewController = viewController
        super.pushViewController(viewController, animated: animated)
    }
}
