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
    @State private var date: Date?
    @State private var time: Date?
    
    @State private var dateSelected: Date = Date()
    @State private var timeSelected: Date = Date()
    
    @State private var taskPriority: Priority?
    
    @Query var tasks: [Task]
    
    private var dateRange: ClosedRange<Date> {
        if dateIsShown  {
                print("Hello")
                return Date()...Date().addingTimeInterval(86400)
            } else {
                print("Else")
                return Date()...Date.distantFuture
            }
        }
    
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
                        Picker("Select a priority", selection: $taskPriority) {
                            Text("High").tag(Priority.high)
                            Text("Medium").tag(Priority.medium)
                            Text("Low").tag(Priority.low)
                        }
                            
                    }
                    
                    Toggle(isOn: $dateIsShown) {
                        Label("Date", systemImage: "calendar")
                    }
                    
                    if(dateIsShown) {
                        
                        DatePicker("Due date",
                                   selection: $dateSelected,
                                   in: Date()...,
                                   displayedComponents: [.date])
                            .datePickerStyle(.graphical)
                            
                    }
                    
                    Toggle(isOn: $timeIsShown) {
                        Label("Time", systemImage: "clock")
                    }
                    
                    if(timeIsShown) {
                        DatePicker("Select a due time",
                                selection: $timeSelected,
                                   in: dateRange,
                                displayedComponents: .hourAndMinute)
                            .datePickerStyle(.graphical)
                    }
                }
                
                Section {
                    Button(action: {
                        createTask(name: taskName, dueDate: date, dueTime: time, priority: taskPriority)
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
                           
    func createTask(name: String, dueDate: Date?, dueTime: Date?, priority: Priority?) {
        
        if (dateIsShown) {
            date = dateSelected
        } else {
            date = nil
        }
        
        if (timeIsShown) {
            time = timeSelected
        } else {
            time = nil
        }
        
        if(taskName != "") {
            let newTask = Task(name: name, dueDate: date, dueTime: time, priority: priority)
            modelContext.insert(newTask)
            isCreateTaskPresented = false
        }
        
        // TODO: Show Dialog Error
    }
    
    func closeMenu() {
        isCreateTaskPresented = false
    }
}


