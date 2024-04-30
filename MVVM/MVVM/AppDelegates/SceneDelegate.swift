//
//  SceneDelegate.swift
//  MVVM
//
//  Created by Arken Sarsenov on 27.04.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let nav  = UINavigationController(rootViewController: MainViewController())
        nav.navigationBar.tintColor = .label
        nav.navigationBar.prefersLargeTitles = true
        window = UIWindow(windowScene: scene)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
}
