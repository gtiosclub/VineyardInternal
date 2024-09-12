//
//  Model.swift
//  VineyardInternal
//
//  Created by Josheev Rai on 9/12/24.
//

import Foundation

enum TimeBound: String, CaseIterable {
    case day
    case week
    case month
}

enum SuccessCheckoff: String{
    case incomplete
    case complete
}

class Person: Identifiable {
    var id: String
    var name: String
    var age: Int

    init(id: String = UUID().uuidString, name: String, age: Int) {
        self.id = id
        self.name = name
        self.age = age
    }
}

class Resolution: Identifiable {
    var id = UUID().uuidString
    var timeBound: TimeBound
    var name: String
    var successCheckoff: SuccessCheckoff
    var progress: Float
    var goal: Float
    var freq: Int // Discuss the ways to make this work

    init(timeBound: TimeBound, name: String, successCheckoff: SuccessCheckoff, progress: Float, goal: Float, freq: Int) {
        self.timeBound = timeBound
        self.name = name
        self.successCheckoff = successCheckoff
        self.progress = progress
        self.goal = goal
        self.freq = freq
    }
}

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

class YearlyResolution: Identifiable {
    var id = UUID().uuidString
    var name: String
    var resolutions: [Resolution]

    init(name: String, resolutions: [Resolution]) {
        self.name = name
        self.resolutions = resolutions
    }
}
