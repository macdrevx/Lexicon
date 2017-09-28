//
//  LexiconEntryTests.swift
//  LexiconTests
//
//  Created by Andrew Hershberger on 9/28/17.
//  Copyright © 2017 Andrew Hershberger. All rights reserved.
//

import XCTest
@testable import Lexicon

extension LexiconEntry {
    static let testInstance = LexiconEntry(id: 0, name: "", definition: "")
}

final class LexiconEntryTests: XCTestCase {

    func testEquatable() {
        let lhs = LexiconEntry.testInstance
        var rhs = lhs
        XCTAssertEqual(lhs, rhs)

        rhs = lhs
        rhs.id += 1
        XCTAssertNotEqual(lhs, rhs)

        rhs = lhs
        rhs.name += "a"
        XCTAssertNotEqual(lhs, rhs)

        rhs = lhs
        rhs.definition += "a"
        XCTAssertNotEqual(lhs, rhs)
    }
}
