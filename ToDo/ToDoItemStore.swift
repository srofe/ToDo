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

    func check(_ item: ToDoItem) {
        var mutableItem = item
        mutableItem.done = true
        if let index = items.firstIndex(of: item) {
            items[index] = mutableItem
        }
    }
}
