//
//  ToDoView.swift
//  VineyardInternal
//
//  Created by Jiyoon Lee on 9/28/24.
//

import SwiftUI

struct ToDoView: View {
    var resolution: Resolution
    var group: String
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text(resolution.description).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .padding(20)
                    Spacer(minLength: 100)
                    
                }
            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//                .padding()
        }.navigationTitle(resolution.title)
    }
}

#Preview {
    ToDoView(resolution: Resolution.samples[0], group: "Group.samples[0]")
}
