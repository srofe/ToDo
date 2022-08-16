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

    func test_view_shouldHaveMapView() throws {
        let subview = try XCTUnwrap(sut.mapView, "The view controller shall have a map view.")
        XCTAssertTrue(subview.isDescendant(of: sut.view), "The map view shall be a subview of the view controllers main view.")
    }

    func test_view_shouldHaveDoneButton() throws {
        let subview = try XCTUnwrap(sut.doneButton, "The view controller shall have a done button.")
        XCTAssertTrue(subview.isDescendant(of: sut.view), "The doneButton shall be a subview of the view controllers main view.")
    }

    func test_settingToDoItem_shouldUpdateTitleLabel() {
        let title = "Dummy title"
        let toDoItem = ToDoItem(title: title)
        sut.toDoItem = toDoItem
        XCTAssertEqual(sut.titleLabel.text, toDoItem.title, "When the item is assigned to the view controller the title label shall contain the item title.")
    }

    func test_settingToDoItem_shouldUpdateDateLabel() {
        let date = Date()
        let toDoItem = ToDoItem(title: "Dummy title", timestamp: date.timeIntervalSince1970)
        sut.toDoItem = toDoItem
        XCTAssertEqual(sut.dateLabel.text, sut.dateFormatter.string(from: date), "When the item is assigned to the view controller the date label shall contain the item date.")
    }

    func test_settingToDoItem_shouldUpdateDescriptionLabel() {
        let description = "dummy description"
        let toDoItem = ToDoItem(title: "Dummy title", itemDescription: description)
        sut.toDoItem = toDoItem
        XCTAssertEqual(sut.descriptionLabel.text, description, "When the item is assigned to the view controller the description label shall contain the item description.")
    }

    func test_settingToDoItem_shouldUpdateLocationLabel() {
        let location = "dummy location"
        let toDoItem = ToDoItem(title: "Dummy title", location: Location(name: location))
        sut.toDoItem = toDoItem
        XCTAssertEqual(sut.locationLabel.text, location, "When the item is assigned to the view controller the location label shall contain the item location text.")
    }

    func test_settingToDoItem_shouldUpdateMapView() {
        let latitude = 51.225556
        let longitude = 6.782778
        let toDoItem = ToDoItem(
            title: "Dummy title",
            location: Location(
                name: "dummy location",
                coordinate: Coordinate(latitude: latitude, longitude: longitude)
                )
        )
        sut.toDoItem = toDoItem
        let center = sut.mapView.centerCoordinate
        XCTAssertEqual(center.latitude, latitude, accuracy: 0.000_01, "When the item is assigned to the view controller the location latitude shall be the location of the item.")
        XCTAssertEqual(center.longitude, longitude, accuracy: 0.000_01, "When the item is assigned to the view controller the location longitude shall be the location of the item.")
    }

    func test_settingToDoItem_shouldUpdateButtonStateIfItemIsDone() {
        var toDoItem = ToDoItem(title: "Dummy title")
        toDoItem.done = true
        sut.toDoItem = toDoItem
        XCTAssertFalse(sut.doneButton.isEnabled, "When the item is assigned to the to the view and the item has been done, the done button shall be disabled.")
    }

    func test_settingToDoItem_shouldUpdateButtonStateIfItemNotDone() {
        let toDoItem = ToDoItem(title: "Dummy title")
        sut.toDoItem = toDoItem
        XCTAssertTrue(sut.doneButton.isEnabled, "When the item is assigned to the view and the item has not been done, the done button shall be enabled.")
    }

    func test_sendingButtonAction_shouldCheckItem() {
        let toDoItem = ToDoItem(title: "Dummy title")
        sut.toDoItem = toDoItem
        let storeMock = ToDoItemStoreMock()
        sut.toDoItemStore = storeMock
        sut.doneButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(storeMock.checkLastCallArgument, toDoItem)
    }
}