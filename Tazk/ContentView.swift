//
//  ContentView.swift
//  Tazk
//
//  Created by Sidney Silva Braz de Oliveira on 1/24/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var tasks: [Task]

    var body: some View {
        NavigationStack {
            List {
                if tasks.isEmpty {
                    Text("No tasks yet. Create one to start managing them!")
                } else {
                    ForEach(tasks) { task in
                        Text(task.name)
                    }
                }
            }
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: CreateTaskView()) {
                        Text("Add a new task")
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .modelContainer(for: Task.self)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Task.self, inMemory: true)
}
