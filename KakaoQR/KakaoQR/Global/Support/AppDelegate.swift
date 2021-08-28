//
//  AppDelegate.swift
//  KakaoQR
//
//  Created by SHIN YOON AH on 2021/08/28.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = MainVC()
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

