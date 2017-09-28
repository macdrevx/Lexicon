//
//  Lexicon.swift
//  Lexicon
//
//  Created by Andrew Hershberger on 9/28/17.
//  Copyright © 2017 Andrew Hershberger. All rights reserved.
//

import Foundation

struct Lexicon: Equatable, Codable {
    var entries: [LexiconEntry]

    func entry(withId id: Int) -> LexiconEntry? {
        return entries.first { $0.id == id }
    }

    // MARK: Equatable

    static func == (lhs: Lexicon, rhs: Lexicon) -> Bool {
        return lhs.entries == rhs.entries
    }
}
