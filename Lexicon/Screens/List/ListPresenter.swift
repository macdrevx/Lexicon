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

protocol ListPresenterDelegate: AnyObject {
    func listPresenter(_ presenter: ListPresenterType, didSelectItemWithId id: Int)
}

protocol ListPresenterType: AnyObject {
    func bind(_ viewController: ListViewControllerType)
}

final class ListPresenter: ListPresenterType {

    weak var delegate: ListPresenterDelegate?

    private let model: ListModelType
    private let disposeBag = DisposeBag()

    init(model: ListModelType) {
        self.model = model
    }

    func bind(_ viewController: ListViewControllerType) {
        viewController
            .driveTableView(with: model.items)
            .disposed(by: disposeBag)

        model
            .drive()
            .disposed(by: disposeBag)

        viewController.listItemSelected
            .drive(onNext: { [unowned self] (listItem) in
                self.delegate?.listPresenter(self, didSelectItemWithId: listItem.id)
            })
            .disposed(by: disposeBag)
    }
}
