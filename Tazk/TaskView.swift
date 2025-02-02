//
//  TaskView.swift
//  Tazk
//
//  Created by Sidney Silva Braz de Oliveira on 1/27/25.
//

import SwiftUI

struct TaskView: View {
    @Environment(\.modelContext) var modelContext
    
    @State var task: Task
    @State var taskIsPressed: Bool = false
    
    @State var showEditTaskView: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                // A checkbox
                Button(action: {
                    task.isCompleted.toggle()
                }, label: {
                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "checkmark.circle")
                        .imageScale(.large)
                }).buttonStyle(.plain)
                
                Button(action: {
                    print(task.name)
                    taskIsPressed.toggle()
                }, label: {
                    HStack {
                        Text(task.name)
                            .foregroundStyle(task.isCompleted ? Color.gray : .primary)
                            .strikethrough(task.isCompleted)
                        if task.priority != nil {
                            switch task.priority {
                                case .high:
                                    if (task.isCompleted) {
                                        Image(systemName: "flag")
                                            .opacity(0.5)
                                            .foregroundStyle(.red)
                                    } else {
                                        Image(systemName: "flag").foregroundStyle(.red)
                                    }
                                case .medium:
                                    if (task.isCompleted) {
                                        Image(systemName: "flag")
                                            .opacity(0.5)
                                            .foregroundStyle(.yellow)
                                    } else {
                                        Image(systemName: "flag").foregroundStyle(.yellow)
                                    }
                                case .low:
                                    if (task.isCompleted) {
                                        Image(systemName: "flag")
                                            .opacity(0.5)
                                            .foregroundStyle(.blue)
                                    } else {
                                        Image(systemName: "flag").foregroundStyle(.blue)
                                    }
                            default:
                                Image(systemName: "info.circle")
                            }
                        }
                    }
                    
                })
                
                Spacer()
                
                Button(action: {
                    showEditTaskView = true
                }, label: {
                    Image(systemName: "pencil.circle")
                }).buttonStyle(.plain)
                
                    .popover(isPresented: $showEditTaskView) {
                        EditTaskView(task: $task, isEditTaskPresented: $showEditTaskView)
                    }
            }
            
            if taskIsPressed {
                VStack(alignment: .leading) {
                    
                    // Show task priority
                    if task.priority != nil {
                        Text(task.priority?.rawValue ?? "No priority").foregroundStyle(.secondary)
                    } else {
                        Text("No priority").foregroundStyle(.secondary)
                    }
                    
                    // Show task dueDate
                    if task.dueDate != nil {
                        Text(
                            task.dueDate!.formatted(date: .abbreviated, time: .omitted)
                        ).foregroundStyle(.secondary)
                    } else {
                        Text("No due date").foregroundStyle(.secondary)
                    }
                    
                    // Show task dueTime
                    if task.dueTime != nil {
                        Text(task.dueTime!.formatted(date: .omitted, time: .shortened)).foregroundStyle(.secondary)
                    } else {
                        Text("No due time").foregroundStyle(.secondary)
                    }
                    
                    
                    Button(action: {
                        modelContext.delete(task)
                    }, label: {
                        Text("Delete this task")
                    }).buttonStyle(.borderedProminent)
                }
                .padding(.vertical)
            }
        }
        
        
        
        
    }
}


