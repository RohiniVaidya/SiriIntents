//
//  AppDelegate.swift
//  SiriExtensionExample
//
//  Created by Admin on 5/8/20.
//  Copyright © 2020 Rohini. All rights reserved.
//

import UIKit
import Intents

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        INPreferences.requestSiriAuthorization { (authorizationStatus) in
            switch authorizationStatus{
            case .authorized:
                print("DEBUG: Siri Authorized")
            case .denied:
                print("DEBUG: Siri Authorization denied")
            case .notDetermined:
                print("DEBUG: Siri Authorization not determined")
            case .restricted:
                print("DEBUG: Siri Authorization is restricted")
            @unknown default:
                print("DEBUG: Siri Authorization is unknown")
            }
        }

        return true
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
       
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

