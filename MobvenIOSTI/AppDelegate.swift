//
//  AppDelegate.swift
//  MobvenIOSTI
//
//  Created by Burak Yılmaz on 9.09.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MobvenExtensions

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let showVersion = Bundle.main.infoDictionary?["ShowVersion"] as? String ?? "NO"
        if showVersion == "YES" {
            UIViewController.versionDelegate = { VersionConfig.shared?.show() }
        }
        
        return true
    }
    
}

