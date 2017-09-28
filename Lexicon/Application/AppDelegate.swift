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

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let lexiconSource = LexiconSource()
        let transformer = ListTransformer()
        let model = ListModel(
            initialState: ListState(lexicon: nil),
            lexiconSource: lexiconSource,
            transformer: transformer)
        let presenter = ListPresenter(
            model: model)
        let listViewController = R.storyboard.list.list()!
        listViewController.presenter = presenter

        let navigationController = UINavigationController(rootViewController: listViewController)
        navigationController.navigationBar.prefersLargeTitles = true

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}
