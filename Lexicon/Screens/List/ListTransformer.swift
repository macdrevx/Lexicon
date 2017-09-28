//
//  ListTransformer.swift
//  Lexicon
//
//  Created by Andrew Hershberger on 9/28/17.
//  Copyright © 2017 Andrew Hershberger. All rights reserved.
//

import Foundation

final class ListTransformer {
    func reduce(event: ListState.Event, state: ListState) -> ListState {
        var updatedState = state
        switch event {
        case let .setLexicon(lexicon):
            updatedState.lexicon = lexicon
        }
        return updatedState
    }

    func items(with state: ListState) -> [ListItem] {
        guard let lexicon = state.lexicon else { return [] }
        return lexicon.entries.map { ListItem(id: $0.id, title: $0.name) }
    }
}
