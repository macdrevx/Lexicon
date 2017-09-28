//
//  ListViewController.swift
//  Lexicon
//
//  Created by Andrew Hershberger on 9/28/17.
//  Copyright © 2017 Andrew Hershberger. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class ListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    private let disposeBag = DisposeBag()
    private let lexiconSource = LexiconSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        lexiconSource.observable
            .map { (lexicon) in
                lexicon.entries.map { ListItem(id: $0.id, title: $0.name) }
            }
            .asDriver(onErrorDriveWith: .never())
            .drive(tableView.rx.items(cellIdentifier: R.reuseIdentifier.listItem.identifier, cellType: UITableViewCell.self)) { (_, item, cell) in
                cell.textLabel?.text = item.title
            }
            .disposed(by: disposeBag)
    }
}
