//
//  ToDoViewModel.swift
//  VineyardInternal
//
//  Created by Jiyoon Lee on 9/28/24.
//

import Foundation

class ToDoViewModel: ObservableObject {
    @Published var groups: [Group] = Group.samples
    
    func groupResolutions(for group: Group) -> [Resolution] {
        return group.resolutions
    }
}
