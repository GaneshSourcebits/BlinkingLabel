//
//  AppDelegate.swift
//  BlinkingLabel
//
//  Created by ganeshsourcebits on 09/03/2018.
//  Copyright (c) 2018 ganeshsourcebits. All rights reserved.
//

import UIKit
import TwitterKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        TWTRTwitter.sharedInstance().start(withConsumerKey:"uibTzw2UZsn31t5daRwHxz8Mr", consumerSecret:"aTSgcUNSym4juium3l05kwm1YmD6rRXhhNZmab4daFQV2tk0ki")
        TWTRTwitter.sharedInstance().start(withConsumerKey: "bOLIk22ODc9hYrXYW2AAQKJyu", consumerSecret: "ZZtHSh7dAwJ74IiNZOX5ICFcOzm1FLDCR9lp9jIW55sz8KYNs4")
        
        GIDSignIn.sharedInstance().clientID = "1010851753559-r39p7qm7uj3konn6ubd000dnsj5j2kac.apps.googleusercontent.com"
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        if url.scheme?.caseInsensitiveCompare("com.googleusercontent.apps.1010851753559-r39p7qm7uj3konn6ubd000dnsj5j2kac") == ComparisonResult.orderedSame {
            return GIDSignIn.sharedInstance().handle(url as URL?,
                                                     sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                     annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        } else {
             return TWTRTwitter.sharedInstance().application(app, open: url, options: options)
        }
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

