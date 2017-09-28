//
//  ListTransformerTests.swift
//  LexiconTests
//
//  Created by Andrew Hershberger on 9/28/17.
//  Copyright © 2017 Andrew Hershberger. All rights reserved.
//

import XCTest
@testable import Lexicon

final class ListTransformerTests: XCTestCase {

    var transformer: ListTransformer!

    override func setUp() {
        super.setUp()
        transformer = ListTransformer()
    }

    override func tearDown() {
        transformer = nil
        super.tearDown()
    }

    func testReduce() {
        var initialState = ListState.testInstance
        initialState.lexicon = nil
        let expectedState = ListState(lexicon: .testInstance)

        let state = transformer.reduce(event: .setLexicon(.testInstance), state: .testInstance)

        XCTAssertEqual(state, expectedState)
    }

    func testItems() {
        var state = ListState.testInstance
        state.lexicon = Lexicon(entries: [LexiconEntry(id: 0, name: "a", definition: "b")])
        let expectedItems = [ListItem(id: 0, title: "a")]

        let items = transformer.items(with: state)

        XCTAssertEqual(items, expectedItems)
    }
}
