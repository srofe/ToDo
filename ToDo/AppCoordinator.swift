//
//  AppCoordinator.swift
//  ToDo
//
//  Created by Simon Rofe on 16/9/2022.
//

import UIKit

protocol Coordinator {
    func start()
}

class AppCoordinator: Coordinator {
    private let window: UIWindow?
    private let viewController: UIViewController

    init(window: UIWindow?) {
        self.window = window
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "ToDoItemsListViewController")
    }

    func start() {
        window?.rootViewController = viewController
    }
}
