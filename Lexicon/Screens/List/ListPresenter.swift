//
//  ListPresenter.swift
//  Lexicon
//
//  Created by Andrew Hershberger on 9/28/17.
//  Copyright © 2017 Andrew Hershberger. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class ListPresenter {

    private let model: ListModel
    private let disposeBag = DisposeBag()

    init(model: ListModel) {
        self.model = model
    }

    func bind(_ viewController: ListViewController) {
        viewController
            .driveTableView(with: model.items)
            .disposed(by: disposeBag)

        model
            .drive()
            .disposed(by: disposeBag)
    }
}
