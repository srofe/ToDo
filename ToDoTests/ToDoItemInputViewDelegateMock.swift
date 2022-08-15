//
//  ToDoItemInputViewDelegateMock.swift
//  ToDoTests
//
//  Created by Simon Rofe on 15/8/2022.
//

import Foundation
@testable import ToDo

class ToDoItemInputViewDelegateMock: ToDoItemInputViewDelegate {
    var lastToDoItemData: ToDoItemData?
    var lastCoordinate: Coordinate?

    func addToDoItem(with data: ToDoItemData, coordinate: Coordinate?) {
        lastToDoItemData = data
        lastCoordinate = coordinate
    }
}
