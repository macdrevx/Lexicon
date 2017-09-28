//
//  ListViewControllerTests.swift
//  LexiconTests
//
//  Created by Andrew Hershberger on 9/28/17.
//  Copyright © 2017 Andrew Hershberger. All rights reserved.
//

import XCTest
@testable import Lexicon

final class ListViewControllerTests: XCTestCase {

    var presenter: MockListPresenter!
    var viewController: ListViewController!
    
    override func setUp() {
        super.setUp()
        presenter = MockListPresenter()
        viewController = ListViewController()
        viewController.tableView = UITableView()
        viewController.presenter = presenter
    }
    
    override func tearDown() {
        viewController = nil
        presenter = nil
        super.tearDown()
    }

    func testBindsInViewDidLoad() {
        _ = viewController.view

        XCTAssertEqual(presenter.bindParams.count, 1)
        XCTAssertTrue(presenter.bindParams.first === viewController)
    }
}
