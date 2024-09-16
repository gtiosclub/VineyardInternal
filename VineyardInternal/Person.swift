//
//  Person.swift
//  VineyardInternal
//
//  Created by Vishnesh Jayanthi Ramanathan on 16/09/24.
//

import Foundation

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
