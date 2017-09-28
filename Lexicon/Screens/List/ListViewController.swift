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
    var listItemSelected: Driver<ListItem> { get }
    func driveTableView(with driver: Driver<[ListItem]>) -> Disposable
}

final class ListViewController: UIViewController, ListViewControllerType {

    var presenter: ListPresenterType!

    @IBOutlet var tableView: UITableView!

    var listItemSelected: Driver<ListItem> {
        return tableView.rx.modelSelected(ListItem.self).asDriver()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.bind(self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPathForSelectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPathForSelectedRow, animated: animated)
        }
    }

    func driveTableView(with driver: Driver<[ListItem]>) -> Disposable {
        return driver.drive(tableView.rx.items(
            cellIdentifier: R.reuseIdentifier.listItem.identifier,
            cellType: UITableViewCell.self)) { (_, item, cell) in
                cell.textLabel?.text = item.title
        }
    }
}
