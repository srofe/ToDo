//
//  APIClient.swift
//  ToDo
//
//  Created by Simon Rofe on 15/8/2022.
//

import Foundation
import CoreLocation

protocol APIClientProtocol {
    func coordinate(for: String, completion: (Coordinate?) -> Void)
}

protocol GeoCoderProtocol {
    func geocodeAddressString(_ addressString: String, completionHandler: @escaping CLGeocodeCompletionHandler)
}

class APIClient: APIClientProtocol {
    lazy var geoCoder: GeoCoderProtocol = CLGeocoder()

    func coordinate(for address: String, completion: (Coordinate?) -> Void) {
        geoCoder.geocodeAddressString(address) { placemarks, error in
        }
    }
}

extension CLGeocoder: GeoCoderProtocol {}
