//
//  LexiconEntriesSource.swift
//  Lexicon
//
//  Created by Andrew Hershberger on 9/28/17.
//  Copyright © 2017 Andrew Hershberger. All rights reserved.
//

import Foundation
import RxSwift

protocol LexiconSourceType: AnyObject {
    var observable: Observable<Lexicon> { get }
    func addEntry(withName name: String, definition: String)
}

final class LexiconSource: LexiconSourceType {

    var observable: Observable<Lexicon> {
        return variable.asObservable()
    }

    private let variable: Variable<Lexicon>
    private var nextId: Int

    init() {
        let url = Bundle.main.url(forResource: "lexicon", withExtension: "json")!
        let decoder = JSONDecoder()
        let data = try! Data(contentsOf: url)
        let lexicon = try! decoder.decode(Lexicon.self, from: data)
        variable = Variable(lexicon)
        nextId = (lexicon.entries.map { $0.id }.max() ?? -1) + 1
    }

    func addEntry(withName name: String, definition: String) {
        let entry = LexiconEntry(id: nextId, name: name, definition: definition)
        variable.value.entries.append(entry)
        nextId += 1
    }
}
