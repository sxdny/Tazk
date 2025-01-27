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
    
    @State var isCreateTaskPresented: Bool = false
    @State var isCompleted: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                if (tasks.isEmpty) {
                    Text("There are no tasks yet.")
                                                
                } else {
                    List {
                        Text("Today").font(.headline)
                            .listRowSeparator(.hidden)

                        ForEach(tasks) { task in
                            
                            TaskView(task: task)
                               
                        }
                    }
                    .listStyle(.plain)
                   
                }
            }
            
            .toolbar {
                ToolbarItem {
                    Button(action: closeCreataTaskView) {
                        Text("Add a new task")
                        
                    }.popover(isPresented: $isCreateTaskPresented) {
                        CreateTaskView(isCreateTaskPresented: $isCreateTaskPresented)
                    }
                }
            }
            
            .navigationTitle(Text("Tazk"))
        }
        
    }
    
    func closeCreataTaskView() {
        isCreateTaskPresented = true
    }
}

#Preview {
    ContentView()
}
