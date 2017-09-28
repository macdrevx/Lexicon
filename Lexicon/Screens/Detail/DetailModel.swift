//
//  DetailModel.swift
//  Lexicon
//
//  Created by Andrew Hershberger on 9/28/17.
//  Copyright © 2017 Andrew Hershberger. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct DetailDrivers {
    var name: Driver<String>
    var definition: Driver<String>
}

protocol DetailModelType {
    func setInitialState(_ state: DetailState)
    func makeDrivers() -> DetailDrivers
    func drive() -> Disposable
}

final class DetailModel: DetailModelType {

    private let lexiconSource: LexiconSourceType
    private let transformer: DetailTransformerType
    private let stateSubject = ReplaySubject<DetailState>.create(bufferSize: 1)

    init(lexiconSource: LexiconSourceType,
         transformer: DetailTransformerType) {
        self.lexiconSource = lexiconSource
        self.transformer = transformer
    }

    func setInitialState(_ state: DetailState) {
        stateSubject.onNext(state)
    }

    func makeDrivers() -> DetailDrivers {
        let state = stateSubject.asDriver(onErrorDriveWith: .never())
        return DetailDrivers(
            name: state.map(transformer.name),
            definition: state.map(transformer.definition))
    }

    func drive() -> Disposable {
        let setLexiconEntryEvents = lexiconSource.observable.map(DetailState.Event.setLexiconEntry)
        return setLexiconEntryEvents
            .withLatestFrom(stateSubject, resultSelector: transformer.reduce)
            .subscribe(stateSubject.asObserver())
    }
}
