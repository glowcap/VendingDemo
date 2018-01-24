//
//  AppDelegate.swift
//  TenTenVending
//
//  Created by Daymein Gregorio on 2018/01/19.
//  Copyright © 2018 Daymein Gregorio. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    let storyboard = UIDevice().type == .iPhoneSE ? UIStoryboard(name: "iPhoneSE", bundle: nil) : UIStoryboard(name: "Main", bundle: nil)
    
    let vC = storyboard.instantiateViewController(withIdentifier: "MainVC")
    let navCon = UINavigationController(rootViewController: vC)
    window?.rootViewController = navCon
      
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {}

  func applicationDidEnterBackground(_ application: UIApplication) {}

  func applicationWillEnterForeground(_ application: UIApplication) {}

  func applicationDidBecomeActive(_ application: UIApplication) {}

  func applicationWillTerminate(_ application: UIApplication) {}


}

