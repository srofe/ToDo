//
//  APIClient.swift
//  ToDo
//
//  Created by Simon Rofe on 15/8/2022.
//

import Foundation

protocol APIClientProtocol {
    func coordinate(for: String, completion: (Coordinate?) -> Void)
}

class APIClient: APIClientProtocol {
    func coordinate(for: String, completion: (Coordinate?) -> Void) {
    }
}
