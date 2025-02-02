//
//  CreateTaskView.swift
//  Tazk
//
//  Created by Sidney Silva Braz de Oliveira on 1/24/25.
//

import SwiftUI
import SwiftData

struct CreateTaskView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Binding var isCreateTaskPresented: Bool
    
    @State private var dateIsShown: Bool = false
    @State private var timeIsShown: Bool = false
    @State private var priorityIsShown: Bool = false
    
    @State private var taskName: String = ""
    @State private var dueDate: Date = Date()
    @State private var taskPriority: Priority?
    
    @Query var tasks: [Task]
    
    var body: some View {
        NavigationStack {
            
            HStack {
                Text("Fill the form to create a new task.")
                    .foregroundColor(.secondary)
                    .padding(.leading)
                Spacer()
                    
            }
                
            
            Form {
                Section("Task") {
                    TextField("Task name", text: $taskName)
                }
                
                Section("Task details") {
                    
                    Toggle(isOn: $priorityIsShown) {
                        
                        Label("Priority", systemImage: "exclamationmark.triangle")
                        
                    }
                    
                    if(priorityIsShown) {
                        Picker("Select a priority", selection: .constant(1)) {
                            Text("High").tag(1)
                            Text("Medium").tag(2)
                            Text("Low").tag(3)
                        }
                            
                    }
                    
                    Toggle(isOn: $dateIsShown) {
                        Label("Date", systemImage: "calendar")
                    }
                    
                    if(dateIsShown) {
                        DatePicker("Due date", selection: $dueDate, displayedComponents: [.date])
                            .datePickerStyle(.graphical)
                    }
                    
                    Toggle(isOn: $timeIsShown) {
                        Label("Time", systemImage: "clock")
                    }
                    
                    if(timeIsShown) {
                        DatePicker("Select a due time", selection: $dueDate, displayedComponents: .hourAndMinute)
                            .datePickerStyle(.graphical)
                    }
                }
                
                Section {
                    Button(action: {
                        createTask(name: taskName, dueDate: dueDate, priority: taskPriority)
                    }) {
                        Text("Create task")
                    }
                }
                
            }
            .navigationTitle("Add a new task")
            .toolbar {
                Button(action: closeMenu) {
                    Text("Close")
                }
            }
        }
        
    }
                           
    func createTask(name: String, dueDate: Date?, priority: Priority?) {
        let newTask = Task(name: name, dueDate: dueDate, priority: priority)
        modelContext.insert(newTask)
        isCreateTaskPresented = false
        
        
    }
    
    func closeMenu() {
        isCreateTaskPresented = false
    }
}

#Preview {
    ContentView()
}
