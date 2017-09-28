//
//  DetailPresenter.swift
//  Lexicon
//
//  Created by Andrew Hershberger on 9/28/17.
//  Copyright © 2017 Andrew Hershberger. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol DetailPresenterDelegate: AnyObject {
}

protocol DetailPresenterType: AnyObject {
    func bind(_ viewController: DetailViewControllerType)
}

final class DetailPresenter: DetailPresenterType {

    weak var delegate: DetailPresenterDelegate?

    private let model: DetailModelType
    private let disposeBag = DisposeBag()

    init(model: DetailModelType) {
        self.model = model
    }

    func bind(_ viewController: DetailViewControllerType) {
        let drivers = model.makeDrivers()

        viewController
            .driveName(with: drivers.name)
            .disposed(by: disposeBag)

        viewController
            .driveDefinition(with: drivers.definition)
            .disposed(by: disposeBag)

        model
            .drive()
            .disposed(by: disposeBag)
    }
}
