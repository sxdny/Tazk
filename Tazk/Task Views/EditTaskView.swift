//
//  EditTaskView.swift
//  Tazk
//
//  Created by Sidney Silva Braz de Oliveira on 2/1/25.
//

import SwiftUI

struct EditTaskView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @State var taskName: String = ""
    
    @Binding var task: Task
    @Binding var isEditTaskPresented: Bool
  
    
    var body: some View {
        NavigationStack {
            
            HStack {
                Text("Change the values of the task with this form.")
                    .foregroundColor(.secondary)
                    .padding(.leading)
                Spacer()
                    
            }
                
            
            Form {
                Section("Task") {
                    TextField("Task name", text: $taskName)
                }
                
                Section {
                    Button(action: {
                        editTask(name: taskName)
                    }) {
                        Text("Save")
                    }
                }
                
            }
            .navigationTitle("Edit task")
            .toolbar {
                Button(action: closeMenu) {
                    Text("Close")
                }
            }
        }
        .onAppear {
            taskName = task.name
        }
        
        
    }
    
    func editTask(name: String) {
        // edit the task
        task.name = taskName
        isEditTaskPresented = false
    }
    
    func closeMenu() {
        isEditTaskPresented = false
    }
    
    
}


