//
//  Group.swift
//  VineyardInternal
//
//  Created by Vishnesh Jayanthi Ramanathan on 16/09/24.
//

import Foundation

class Group: Identifiable {
    var id = UUID().uuidString
    var title: String
    var people: [Person]
    var yearlyResolution: YearlyResolution

    init(people: [Person], yearlyResolution: YearlyResolution, title: String) {
        self.people = people
        self.yearlyResolution = yearlyResolution
        self.title = title
    }
}
