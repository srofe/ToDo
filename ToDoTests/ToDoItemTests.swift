//
//  ToDoItemTests.swift
//  ToDoItemTests
//
//  Created by Simon Rofe on 27/7/2022.
//

import XCTest
@testable import ToDo

class ToDoItemTests: XCTestCase {
    func test_init_takesTitle() {
        _ = ToDoItem(title: "Dummy")
    }
}
