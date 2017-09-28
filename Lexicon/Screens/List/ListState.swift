//
//  ListState.swift
//  Lexicon
//
//  Created by Andrew Hershberger on 9/28/17.
//  Copyright © 2017 Andrew Hershberger. All rights reserved.
//

import Foundation

struct ListState: Equatable {
    var lexicon: Lexicon?

    // MARK: Equatable

    static func == (lhs: ListState, rhs: ListState) -> Bool {
        return lhs.lexicon == rhs.lexicon
    }

    // MARK: -

    enum Event {
        case setLexicon(Lexicon)
    }
}
