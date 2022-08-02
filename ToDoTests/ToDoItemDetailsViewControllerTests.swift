//
//  ToDoItemDetailsViewControllerTests.swift
//  ToDoTests
//
//  Created by Simon Rofe on 2/8/2022.
//

import XCTest
@testable import ToDo

class ToDoItemDetailsViewControllerTests: XCTestCase {
    var sut: ToDoItemDetailsViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = (storyboard.instantiateViewController(identifier: "ToDoItemDetailsViewController") as! ToDoItemDetailsViewController)
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_view_shouldHaveTitleLabel() throws {
        let subview = try XCTUnwrap(sut.titleLabel, "The view controller shall have a title label.")
        XCTAssertTrue(subview.isDescendant(of: sut.view), "The title label view shall be a subview of the view controllers main view.")
    }

    func test_view_shouldHaveDateLabel() throws {
        let subview = try XCTUnwrap(sut.dateLabel, "The view controller shall have a date label.")
        XCTAssertTrue(subview.isDescendant(of: sut.view), "The date label view shall be a subview of the view controllers main view.")
    }

    func test_view_shouldHaveLocationLabel() throws {
        let subview = try XCTUnwrap(sut.locationLabel, "The view controller shall have a location label.")
        XCTAssertTrue(subview.isDescendant(of: sut.view), "The location label view shall be a subview of the view controllers main view.")
    }

    func test_view_shouldHaveDescriptionLabel() throws {
        let subview = try XCTUnwrap(sut.descriptionLabel, "The view controller shall have a description label.")
        XCTAssertTrue(subview.isDescendant(of: sut.view), "The description label view shall be a subview of the view controllers main view.")
    }
}