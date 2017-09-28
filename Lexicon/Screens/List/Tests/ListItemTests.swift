//
//  ListItemTests.swift
//  LexiconTests
//
//  Created by Andrew Hershberger on 9/28/17.
//  Copyright © 2017 Andrew Hershberger. All rights reserved.
//

import XCTest
@testable import Lexicon

extension ListItem {
    static let testInstance = ListItem(id: 0, title: "")
}

final class ListItemTests: XCTestCase {

    func testEquatable() {
        let lhs = ListItem.testInstance
        var rhs = lhs
        XCTAssertEqual(lhs, rhs)

        rhs = lhs
        rhs.id += 1
        XCTAssertNotEqual(lhs, rhs)

        rhs = lhs
        rhs.title += "a"
        XCTAssertNotEqual(lhs, rhs)
    }
}
