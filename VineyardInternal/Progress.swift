//
//  Progress.swift
//  VineyardInternal
//
//  Created by Jiyoon Lee on 9/29/24.
//

import Foundation

struct Progress: Identifiable {
    let id: UUID = .init()
    var resolution: Resolution
    var completionArray: [Date] = []
    var quantityGoal: Float
    var frequencyGoal: Frequency
    var person: Person
    
//    mutating func updateProgress(to newProgress: Double) {
//        self.progress = newProgress
//    }
//    
//    //func isCompleted() -> Bool {
//    //    progress == 1.0
//    //}
    
    static var samples: [Progress] {

        let resolution1 = Resolution.samples[0]
        let progress1 = Progress(resolution: resolution1, quantityGoal: 1, frequencyGoal: Frequency.weekly(count: 3), person: Person.samples[0])
        
        let progress2 = Progress(resolution: resolution1, quantityGoal: 1, frequencyGoal: Frequency.weekly(count: 3), person: Person.samples[1])
        
        let progress3 = Progress(resolution: resolution1, quantityGoal: 1, frequencyGoal: Frequency.weekly(count: 3), person: Person.samples[2])
        
        let resolution2 = Resolution.samples[1]
        let progress4 = Progress(resolution: resolution2, quantityGoal: 1, frequencyGoal: Frequency.weekly(count: 3), person: Person.samples[0])
        
        let progress5 = Progress(resolution: resolution2, quantityGoal: 1, frequencyGoal: Frequency.weekly(count: 3), person: Person.samples[1])
        
        let progress6 = Progress(resolution: resolution2, quantityGoal: 1, frequencyGoal: Frequency.weekly(count: 3), person: Person.samples[2])
        
        return [progress1, progress2, progress3, progress4, progress5, progress6]
    }
}
