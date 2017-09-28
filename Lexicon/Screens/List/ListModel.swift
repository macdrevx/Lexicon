//
//  ListModel.swift
//  Lexicon
//
//  Created by Andrew Hershberger on 9/28/17.
//  Copyright © 2017 Andrew Hershberger. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class ListModel {

    private let lexiconSource: LexiconSource
    private let transformer: ListTransformer
    private let stateSubject = ReplaySubject<ListState>.create(bufferSize: 1)

    var items: Driver<[ListItem]> {
        return stateSubject.asDriver(onErrorDriveWith: .never()).map(transformer.items)
    }

    init(initialState: ListState,
         lexiconSource: LexiconSource,
         transformer: ListTransformer) {
        self.lexiconSource = lexiconSource
        self.transformer = transformer
        stateSubject.onNext(initialState)
    }

    func setInitialState(_ state: ListState) {
        stateSubject.onNext(state)
    }

    func drive() -> Disposable {
        let setLexiconEvents = lexiconSource.observable.map(ListState.Event.setLexicon)
        return setLexiconEvents
            .withLatestFrom(stateSubject, resultSelector: transformer.reduce)
            .subscribe(stateSubject.asObserver())
    }
}
