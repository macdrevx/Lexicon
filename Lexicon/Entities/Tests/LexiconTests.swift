//
//  LexiconTests.swift
//  LexiconTests
//
//  Created by Andrew Hershberger on 9/28/17.
//  Copyright © 2017 Andrew Hershberger. All rights reserved.
//

import XCTest
@testable import Lexicon

extension Lexicon {
    static let testInstance = Lexicon(entries: [])
}

final class LexiconTests: XCTestCase {

    func testEquatable() {
        let lhs = Lexicon.testInstance
        var rhs = lhs
        XCTAssertEqual(lhs, rhs)

        rhs = lhs
        rhs.entries.append(.testInstance)
        XCTAssertNotEqual(lhs, rhs)
    }

    func testEntryWithId() {
        var lexicon = Lexicon.testInstance
        lexicon.entries = (1...3).map {
            LexiconEntry(
                id: $0,
                name: $0.description,
                definition: $0.description)
        }

        XCTAssertNil(lexicon.entry(withId: 0))
        XCTAssertNil(lexicon.entry(withId: 4))
        XCTAssertEqual(lexicon.entry(withId: 2), lexicon.entries[1])
    }
}
