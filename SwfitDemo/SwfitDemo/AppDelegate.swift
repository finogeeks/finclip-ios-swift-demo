//
//  AppDelegate.swift
//  SwfitDemo
//
//  Created by 胡健辉 on 2021/11/19.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let bundleId = Bundle.main.bundleIdentifier;
        let path = Bundle.main.path(forResource: "servers", ofType: "plist") ?? "";
        let servers = NSDictionary.init(contentsOf: URL.init(fileURLWithPath: path))
        let data: NSDictionary = servers?[bundleId] as! NSDictionary;
        let appKey = data["appKey"];
        let appSecret = data["appSecret"] as! String;
        let apiServer = data["apiServer"] as! String;
        let type = data["cryptType"] as! String;

        let cryptType = (type == "MD5") ? FATApiCryptType.MD5 : FATApiCryptType.SM;
        
        let config = FATConfig.init(appSecret: appSecret, appKey: appKey as! String);
        config.apiServer = apiServer
        config.cryptType = cryptType
        
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

