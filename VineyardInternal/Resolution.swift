//
//  Resolution.swift
//  VineyardInternal
//
//  Created by Vishnesh Jayanthi Ramanathan on 16/09/24.
//

import Foundation

enum TimeBound: String, CaseIterable {
    case day = "Daily"
    case week = "Weekly"
    case month = "Monthly"
}

enum SuccessCheckoff: String{
    case incomplete
    case complete
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
    
    func toDictionary() -> [String: Any] {
        return [
            "id": self.id,
            "name": self.name,
            "timeBound": self.timeBound.rawValue,
            "successCheckoff": self.successCheckoff.rawValue,
            "progress": self.progress,
            "goal": self.goal,
            "freq": self.freq
        ]
    }
}
