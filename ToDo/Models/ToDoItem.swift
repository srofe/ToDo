//
//  ToDoItem.swift
//  ToDo
//
//  Created by Simon Rofe on 15/11/17.
//  Copyright © 2017 Simon Rofe. All rights reserved.
//

import Foundation

struct ToDoItem: Equatable {
    let title: String
    let description: String?
    let timestamp: Double?
    let location: Location?

    init(title: String, description: String? = nil, timestamp: Double? = nil, location: Location? = nil) {
        self.title = title
        self.description = description
        self.timestamp = timestamp
        self.location = location
    }

    static func ==(lhs: ToDoItem, rhs: ToDoItem) -> Bool {
        if lhs.title != rhs.title {
            return false
        }
        if lhs.description != rhs.description {
            return false
        }
        if lhs.timestamp != rhs.timestamp {
            return false
        }
        if lhs.location != rhs.location {
            return false
        }
        return true
    }
}
