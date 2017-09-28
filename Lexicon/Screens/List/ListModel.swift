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

protocol ListModelType {
    var items: Driver<[ListItem]> { get }
    func drive() -> Disposable
}

final class ListModel: ListModelType {

    private let lexiconSource: LexiconSourceType
    private let transformer: ListTransformerType
    private let stateSubject = ReplaySubject<ListState>.create(bufferSize: 1)

    var items: Driver<[ListItem]> {
        return stateSubject.asDriver(onErrorDriveWith: .never()).map(transformer.items)
    }

    init(initialState: ListState,
         lexiconSource: LexiconSourceType,
         transformer: ListTransformerType) {
        self.lexiconSource = lexiconSource
        self.transformer = transformer
        stateSubject.onNext(initialState)
    }

    func drive() -> Disposable {
        let setLexiconEvents = lexiconSource.observable.map(ListState.Event.setLexicon)
        return setLexiconEvents
            .withLatestFrom(stateSubject, resultSelector: transformer.reduce)
            .subscribe(stateSubject.asObserver())
    }
}
