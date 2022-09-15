//
//  AppSetupTests.swift
//  ToDoTests
//
//  Created by Simon Rofe on 16/9/2022.
//

import XCTest
@testable import ToDo

class AppSetupTests: XCTestCase {
    func test_application_shouldSetupRoot() {
        let application = UIApplication.shared
        let scene = application.connectedScenes.first as? UIWindowScene
        let root = scene?.windows.first?.rootViewController
        XCTAssert(root is ToDoItemsListViewController)
    }
}
