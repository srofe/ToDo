//
//  SceneDelegate.swift
//  ToDo
//
//  Created by Simon Rofe on 27/7/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let coordinator = AppCoordinator(window: window)
        coordinator.start()
        appCoordinator = coordinator
        window?.makeKeyAndVisible()
    }
}
