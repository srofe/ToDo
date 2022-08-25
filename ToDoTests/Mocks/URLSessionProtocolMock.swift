//
//  URLSessionProtocolMock.swift
//  ToDoTests
//
//  Created by Simon Rofe on 25/8/2022.
//

import Foundation
@testable import ToDo

class URLSessionProtocolMock: URLSessionProtocol {
    var dataForDelegateReturnValue: (Data, URLResponse)?
    var dataForDelegateRequest: URLRequest?

    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        dataForDelegateRequest = request
        guard let dataForDelegateReturnValue = dataForDelegateReturnValue else {
            fatalError()
        }
        return dataForDelegateReturnValue
    }
}
