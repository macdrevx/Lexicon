//
//  ListStateTests.swift
//  LexiconTests
//
//  Created by Andrew Hershberger on 9/28/17.
//  Copyright © 2017 Andrew Hershberger. All rights reserved.
//

import XCTest
@testable import Lexicon

extension ListState {
    static let testInstance = ListState(lexicon: nil)
}

final class ListStateTests: XCTestCase {

    func testEquatable() {
        let lhs = ListState.testInstance
        var rhs = lhs
        XCTAssertEqual(lhs, rhs)

        rhs = lhs
        rhs.lexicon = .testInstance
        XCTAssertNotEqual(lhs, rhs)
    }
}
