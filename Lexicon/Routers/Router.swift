//
//  Router.swift
//  Lexicon
//
//  Created by Andrew Hershberger on 9/28/17.
//  Copyright © 2017 Andrew Hershberger. All rights reserved.
//

import UIKit

final class Router: ListPresenterDelegate, DetailPresenterDelegate {

    private let dependencyProvider: RouterDependencyProviderType
    private let navigationController: UINavigationController

    init(window: UIWindow, dependencyProvider: RouterDependencyProviderType = RouterDependencyProvider()) {
        self.dependencyProvider = dependencyProvider
        self.navigationController = dependencyProvider.makeNavigationController()

        let mainViewController = dependencyProvider.makeListViewController(delegate: self)
        navigationController.viewControllers = [mainViewController]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    // MARK: - ListPresenterDelegate

    func listPresenter(_ presenter: ListPresenterType, didSelectItemWithId id: Int) {
        let viewController = dependencyProvider.makeDetailViewController(
            lexiconEntryId: id,
            delegate: self)
        navigationController.pushViewController(viewController, animated: true)
    }

    // MARK: - DetailPresenterDelegate
}
