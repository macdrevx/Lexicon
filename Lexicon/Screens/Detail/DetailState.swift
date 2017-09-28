//
//  DetailState.swift
//  Lexicon
//
//  Created by Andrew Hershberger on 9/28/17.
//  Copyright © 2017 Andrew Hershberger. All rights reserved.
//

import Foundation

struct DetailState {
    var lexiconEntryId: Int
    var lexiconEntry: LexiconEntry?

    enum Event {
        case setLexiconEntry(lexicon: Lexicon)
    }
}
