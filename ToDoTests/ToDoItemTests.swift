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
        let item = ToDoItem(title: "Dummy")
        XCTAssertNotNil(item, "The ToDo item shall not be nil.")
    }
}
