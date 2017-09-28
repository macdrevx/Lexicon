//
//  AppDelegate.swift
//  Lexicon
//
//  Created by Andrew Hershberger on 9/28/17.
//  Copyright © 2017 Andrew Hershberger. All rights reserved.
//

import UIKit

final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    private var router: Router!

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        router = Router(window: window!)
        return true
    }
}
