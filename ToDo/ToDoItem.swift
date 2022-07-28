//
//  ToDoItem.swift
//  ToDo
//
//  Created by Simon Rofe on 27/7/2022.
//

import Foundation

struct ToDoItem: Equatable {
    let id: UUID
    let title: String
    let itemDescription: String?
    let timestamp: TimeInterval?
    let location: Location?
    var done = false

    init(title: String, itemDescription: String? = nil, timestamp: TimeInterval? = nil, location: Location? = nil) {
        self.id = UUID()
        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
        self.location = location
    }

    static func ==(lhs: ToDoItem, rhs: ToDoItem) -> Bool {
        lhs.id == rhs.id
    }
}
