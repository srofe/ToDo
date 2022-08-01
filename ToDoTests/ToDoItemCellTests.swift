//
//  ToDoItemCellTests.swift
//  ToDoTests
//
//  Created by Simon Rofe on 1/8/2022.
//

import XCTest
@testable import ToDo

class ToDoItemCellTests: XCTestCase {
    var sut: ToDoItemCell!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ToDoItemCell()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_hasTitleLabelSubview() {
        let subView = sut.titleLabel
        XCTAssertTrue(subView.isDescendant(of: sut.contentView), "The ToDoItemCell shall have a title label view as a subview of its content.")
    }

    func test_hasDateLabelSubview() {
        let subView = sut.dateLabel
        XCTAssertTrue(subView.isDescendant(of: sut.contentView), "The ToDoItemCell shall have a date label view as a subview of its content.")
    }
}
