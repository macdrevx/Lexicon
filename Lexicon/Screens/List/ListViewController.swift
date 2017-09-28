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

    var presenter: ListPresenter!

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.bind(self)
    }

    func driveTableView(with driver: Driver<[ListItem]>) -> Disposable {
        return driver.drive(tableView.rx.items(
            cellIdentifier: R.reuseIdentifier.listItem.identifier,
            cellType: UITableViewCell.self)) { (_, item, cell) in
                cell.textLabel?.text = item.title
        }
    }
}
