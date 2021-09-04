//
//  AppDelegate.swift
//  KakaoQR
//
//  Created by SHIN YOON AH on 2021/08/28.
//

import UIKit
import ReactorKit
import WidgetKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        var vc = MainVC()
        vc.view.backgroundColor = .systemBackground
        window.rootViewController = vc
        vc.bind(reactor: MainReactor())
        self.window = window
        window.makeKeyAndVisible()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
            let qrcodeLinkPath = ""

            guard let components = NSURLComponents(url: url, resolvingAgainstBaseURL: true), let path = components.path else {
                return false
            }
        
            if path == qrcodeLinkPath {
                var nextVC = QRCodeVC()
                nextVC.bind(reactor: QRCodeReactor(root: nextVC))
                nextVC.modalPresentationStyle = .overFullScreen
                if var rootVC = window?.rootViewController as? MainVC {
                    rootVC.useWidget = true
                    rootVC.bind(reactor: MainReactor())
                }

                return true
            } else {
                return false
            }
        }
}

