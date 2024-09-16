//
//  YearlyResolution.swift
//  VineyardInternal
//
//  Created by Vishnesh Jayanthi Ramanathan on 16/09/24.
//

import Foundation

class YearlyResolution: Identifiable {
    var id = UUID().uuidString
    var name: String
    var resolutions: [Resolution]

    init(name: String, resolutions: [Resolution]) {
        self.name = name
        self.resolutions = resolutions
    }
    
    func toDictionary() -> [String: Any] {
        let resolutionIDs = self.resolutions.map { $0.id } // This creates an array of resolutionIDs
        return [
            "name": self.name,
            "resolutions": resolutionIDs
        ]
    }
}
