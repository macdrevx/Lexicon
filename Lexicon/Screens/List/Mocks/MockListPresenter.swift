//
//  MockListPresenter.swift
//  LexiconTests
//
//  Created by Andrew Hershberger on 9/28/17.
//  Copyright © 2017 Andrew Hershberger. All rights reserved.
//

import Foundation
@testable import Lexicon

final class MockListPresenter: ListPresenterType {
    var bindParams = [ListViewControllerType]()
    func bind(_ viewController: ListViewControllerType) {
        bindParams.append(viewController)
    }
}
