//
//  ToDoItem.swift
//  ToDo
//
//  Created by Simon Rofe on 27/7/2022.
//

import Foundation

struct ToDoItem {
    let title: String
    let itemDescription: String?
    let timestamp: TimeInterval?
    let location: Location?

    init(title: String, itemDescription: String? = nil, timestamp: TimeInterval? = nil, location: Location? = nil) {
        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
        self.location = location
    }
}
