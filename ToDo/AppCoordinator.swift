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
    private let navigationController: UINavigationController

    init(window: UIWindow?, navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "ToDoItemsListViewController")
    }

    func start() {
        navigationController.pushViewController(viewController, animated: false)
        window?.rootViewController = navigationController
    }
}
