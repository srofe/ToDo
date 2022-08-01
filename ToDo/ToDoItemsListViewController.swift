//
//  ToDoItemsListViewController.swift
//  ToDo
//
//  Created by Simon Rofe on 29/7/2022.
//

import UIKit
import Combine

enum Section {
    case main
}

class ToDoItemsListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var toDoItemStore: ToDoItemStorable?
    private var items: [ToDoItem] = []
    private var token: AnyCancellable?
    let dateFormatter = DateFormatter()
    private var dataSource: UITableViewDiffableDataSource<Section,ToDoItem>?

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = UITableViewDiffableDataSource<Section,ToDoItem>(
            tableView: tableView,
            cellProvider: { [weak self] tableView, indexPath, item in
                let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) as! ToDoItemCell
                cell.titleLabel.text = item.title
                if let timestamp = item.timestamp {
                    let date = Date(timeIntervalSince1970: timestamp)
                    cell.dateLabel.text = self?.dateFormatter.string(from: date)
                }
                return cell
            })
        token = toDoItemStore?.itemPublisher
            .sink { [weak self] items in
                self?.items = items
                self?.update(with: items)
            }
        tableView.register(ToDoItemCell.self, forCellReuseIdentifier: "ToDoItemCell")
    }

    private func update(with items: [ToDoItem]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section,ToDoItem>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items)
        dataSource?.apply(snapshot)
    }
}
