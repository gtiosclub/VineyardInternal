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
}
