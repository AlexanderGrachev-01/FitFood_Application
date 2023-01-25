//
//  SceneDelegate.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 13.01.2023.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        
        guard Auth.auth().currentUser != nil else {
            window?.rootViewController = UINavigationController(rootViewController: FFWelcomePageViewController())
            return
        }
        
        window?.rootViewController = FFTabBarController()
    }
}
