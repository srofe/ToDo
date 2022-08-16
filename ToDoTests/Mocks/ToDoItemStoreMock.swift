//
//  ToDoItemStoreMock.swift
//  ToDoTests
//
//  Created by Simon Rofe on 29/7/2022.
//

import Foundation
@testable import ToDo
import Combine

class ToDoItemStoreMock: ToDoItemStorable {
    var itemPublisher = CurrentValueSubject<[ToDoItem], Never>([])
    var checkLastCallArgument: ToDoItem?

    func check(_ item: ToDoItem) {
        checkLastCallArgument = item
    }
}
