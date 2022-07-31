//
//  ToDoItemsListViewController.swift
//  ToDo
//
//  Created by Simon Rofe on 29/7/2022.
//

import UIKit
import Combine

class ToDoItemsListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var toDoItemStore: ToDoItemStorable?
    private var items: [ToDoItem] = []
    private var token: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        token = toDoItemStore?.itemPublisher
            .sink { [weak self] items in
                self?.items = items
            }
    }
}

extension ToDoItemsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ToDoItemCell()
        let item = items[indexPath.row]
        cell.titleLabel.text = item.title
        return cell
    }
}
