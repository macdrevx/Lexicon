//
//  RouterDependencyProvider.swift
//  Lexicon
//
//  Created by Andrew Hershberger on 9/28/17.
//  Copyright © 2017 Andrew Hershberger. All rights reserved.
//

import UIKit

protocol RouterDependencyProviderType {
    func makeNavigationController() -> UINavigationController
    func makeListViewController(delegate: ListPresenterDelegate) -> UIViewController
    func makeDetailViewController(lexiconEntryId id: Int,
                                  delegate: DetailPresenterDelegate) -> UIViewController
}

final class RouterDependencyProvider: RouterDependencyProviderType {
    private let lexiconSource = LexiconSource()

    func makeNavigationController() -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }

    func makeListViewController(delegate: ListPresenterDelegate) -> UIViewController {
        let transformer = ListTransformer()
        let model = ListModel(
            initialState: ListState(lexicon: nil),
            lexiconSource: lexiconSource,
            transformer: transformer)
        let presenter = ListPresenter(
            model: model)
        presenter.delegate = delegate
        let viewController = R.storyboard.list.list()!
        viewController.presenter = presenter
        return viewController
    }

    func makeDetailViewController(lexiconEntryId id: Int,
                                  delegate: DetailPresenterDelegate) -> UIViewController {
        let transformer = DetailTransformer()
        let model = DetailModel(
            lexiconSource: lexiconSource,
            transformer: transformer)
        model.setInitialState(DetailState(
            lexiconEntryId: id,
            lexiconEntry: nil))
        let presenter = DetailPresenter(model: model)
        presenter.delegate = delegate
        let viewController = R.storyboard.detail.detail()!
        viewController.presenter = presenter
        return viewController
    }
}
