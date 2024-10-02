//
//  Resolution.swift
//  VineyardInternal
//
//  Created by Vishnesh Jayanthi Ramanathan on 16/09/24.
//

import Foundation


struct Frequency {
    var frequencyType: FrequencyType
    var count: Int
}

enum FrequencyType {
    case daily
    case weekly
    case monthly
}
struct Difficulty {
    var difficultyLevel: DifficultyLevel
    var score: Int
}

enum DifficultyLevel {
    case easy
    case medium
    case hard
}



class Resolution: Identifiable {
    let id: UUID
    var title: String
    var description: String
    var defaultQuantity: Int? = nil
    var defaultFrequency: Frequency
    var diffLevel: Difficulty
    var groupName: String
    
    init(title: String, description: String, quantity: Int? = nil, frequency: Frequency, diffLevel: Difficulty, group: String) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.defaultQuantity = quantity
        self.defaultFrequency = frequency
        self.diffLevel = diffLevel
        self.groupName = group
    }
    
    static var samples: [Resolution] {
        let group1 = "hahahahha"
        
        let resolution1 = Resolution(title: "Run miles", description: "Run a certain number of miles", quantity: 5, frequency: Frequency(frequencyType: FrequencyType.weekly, count: 1), diffLevel: Difficulty(difficultyLevel: DifficultyLevel.medium, score: 5), group: group1)
        let resolution2 = Resolution(title: "Drink 7 cups of water", description: "Drink more water", frequency: Frequency(frequencyType: FrequencyType.daily, count: 1), diffLevel: Difficulty(difficultyLevel: DifficultyLevel.easy, score: 2), group: group1)
                
        return [resolution1, resolution2]
    }
}
