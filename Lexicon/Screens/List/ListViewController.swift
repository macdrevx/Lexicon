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

protocol ListViewControllerType: AnyObject {
    func driveTableView(with driver: Driver<[ListItem]>) -> Disposable
}

final class ListViewController: UIViewController, ListViewControllerType {

    var presenter: ListPresenterType!

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
