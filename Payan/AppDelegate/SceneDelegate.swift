//
//  SceneDelegate.swift
//  Payan
//
//  Created by juandahurt on 15/09/21.
//

import UIKit
import Willow
import SkeletonView

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let navigationController = UINavigationController()
        navigationController.navigationBar.isHidden = true
        window?.rootViewController = navigationController
        
        SkeletonAppearance.default.tintColor = AppStyle.Color.skeleton
        
        let module = LaunchModule.setup(with: navigationController)
        module.show()
        
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        Console.log("scene did disconnect", level: .event)
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        Console.log("scene did become active", level: .event)
    }

    func sceneWillResignActive(_ scene: UIScene) {
        Console.log("scene will resign active", level: .event)
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        Console.log("scene will enter foreground", level: .event)
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        Console.log("scene did enter background", level: .event)
    }
}

