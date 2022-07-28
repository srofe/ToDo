//
//  ToDoItemStore.swift
//  ToDo
//
//  Created by Simon Rofe on 28/7/2022.
//

import Foundation
import Combine

class ToDoItemStore {
    var itemPublisher = CurrentValueSubject<[ToDoItem],Never>([])
    private var items: [ToDoItem] = [] {
        didSet {
            itemPublisher.send(items)
        }
    }

    func add(_ item: ToDoItem) {
        items.append(item)
    }
}
