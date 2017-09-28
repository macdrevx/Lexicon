//
//  DetailTransformer.swift
//  Lexicon
//
//  Created by Andrew Hershberger on 9/28/17.
//  Copyright © 2017 Andrew Hershberger. All rights reserved.
//

import Foundation

protocol DetailTransformerType {
    func reduce(event: DetailState.Event, state: DetailState) -> DetailState

    func name(with state: DetailState) -> String
    func definition(with state: DetailState) -> String
}

final class DetailTransformer: DetailTransformerType {
    func reduce(event: DetailState.Event, state: DetailState) -> DetailState {
        var updatedState = state
        switch event {
        case let .setLexiconEntry(lexicon):
            updatedState.lexiconEntry = lexicon.entry(withId: state.lexiconEntryId)
        }
        return updatedState
    }

    func name(with state: DetailState) -> String {
        return state.lexiconEntry?.name ?? ""
    }

    func definition(with state: DetailState) -> String {
        return state.lexiconEntry?.definition ?? ""
    }
}
