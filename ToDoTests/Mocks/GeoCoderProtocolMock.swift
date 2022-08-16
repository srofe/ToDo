//
//  GeoCoderProtocolMock.swift
//  ToDoTests
//
//  Created by Simon Rofe on 16/8/2022.
//

import Foundation
@testable import ToDo
import CoreLocation

class GeoCoderProtocolMock : GeoCoderProtocol {
    var gecodeAddressString: String?
    var completionHandler: CLGeocodeCompletionHandler?

    func geocodeAddressString(_ addressString: String, completionHandler: @escaping CLGeocodeCompletionHandler) {
        gecodeAddressString = addressString
        self.completionHandler = completionHandler
    }
}
