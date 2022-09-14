//
//  APIClientMock.swift
//  ToDoTests
//
//  Created by Simon Rofe on 15/8/2022.
//

import Foundation
@testable import ToDo

class APIClientMock: APIClientProtocol {
    var coordinateAddress: String?
    var coordinateReturnValue: Coordinate?

    func coordinate(for address: String, completion: (Coordinate?) -> Void) {
        coordinateAddress = address
        completion(coordinateReturnValue)
    }
}
