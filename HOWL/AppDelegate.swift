//
//  AppDelegate.swift
//  HOWL
//
//  Created by Daniel Clelland on 14/11/15.
//  Copyright © 2015 Daniel Clelland. All rights reserved.
//

import UIKit
import AudioKit
import AudioToolbox

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var howlViewController: HowlViewController? {
        return window?.rootViewController as? HowlViewController
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        AKSettings.shared().audioInputEnabled = true
        AKSettings.shared().playbackWhileMuted = true
        AKSettings.shared().defaultToSpeaker = false
        
        Audio.start()
        Audiobus.start()
        
        Audio.didSetClient = {
            self.howlViewController?.keyboardViewController?.reloadSynthesizer()
            self.howlViewController?.phonemeboardViewController?.reloadVocoder()
        }
        
        return true
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        Audio.start()
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        if (Audiobus.client?.isConnected == false) {
            Audio.stop()
        }
    }

}
