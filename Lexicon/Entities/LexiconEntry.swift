//
//  LexiconEntry.swift
//  Lexicon
//
//  Created by Andrew Hershberger on 9/28/17.
//  Copyright © 2017 Andrew Hershberger. All rights reserved.
//

import Foundation

struct LexiconEntry: Equatable, Codable {
    var id: Int
    var name: String
    var definition: String

    // MARK: Equatable

    static func == (lhs: LexiconEntry, rhs: LexiconEntry) -> Bool {
        return lhs.id == rhs.id
            && lhs.name == rhs.name
            && lhs.definition == rhs.definition
    }
}
