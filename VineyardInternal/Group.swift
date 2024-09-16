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

    init(people: [Person] = [], yearlyResolution: YearlyResolution = .init(name: "Yearly Resolution", resolutions: []), title: String = "Group Name") {
        self.people = people
        self.yearlyResolution = yearlyResolution
        self.title = title
    }
    
    func toDictionary() -> [String: Any] {
        let peopleIDs = self.people.map { $0.id } // This creates an array of peopleIDs
        let yearlyResolutionDict = self.yearlyResolution.toDictionary()
        return [
            "id": self.id,
            "people": peopleIDs,
            "yearlyResolution": yearlyResolutionDict
        ]
    }
}
