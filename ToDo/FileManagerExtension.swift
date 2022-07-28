//
//  FileManagerExtension.swift
//  ToDo
//
//  Created by Simon Rofe on 29/7/2022.
//

import Foundation

extension FileManager {
    func documentsURL(name: String) -> URL {
        guard let documentsURL = urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Error locating document directory.")
        }
        return documentsURL.appendingPathComponent(name)
    }
}
