//
//  AppDelegate.swift
//  SettingsApp
//
//  Created by Kazhymurat on 22.02.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController(rootViewController: ViewController())
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
        return true
    }
}

