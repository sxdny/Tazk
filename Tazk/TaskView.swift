//
//  TaskView.swift
//  Tazk
//
//  Created by Sidney Silva Braz de Oliveira on 1/27/25.
//

import SwiftUI

struct TaskView: View {
    @State var task: Task
    @State var isCompleted: Bool = false
    @State var taskIsPressed: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                // A checkbox
                Button(action: {
                    isCompleted.toggle()
                }, label: {
                    Image(systemName: isCompleted ? "checkmark.circle.fill" : "checkmark.circle")
                        .imageScale(.large)
                }).buttonStyle(.plain)
                Button(action: {
                    print(task.name)
                    taskIsPressed.toggle()
                }, label: {
                    Text(task.name).foregroundStyle(isCompleted ? Color.gray : .primary)
                        .strikethrough(isCompleted)
                })
            }
            if taskIsPressed {
                HStack {
                    Text("Description:")
                    Text(task.name)
                }
                .padding(.vertical)
            }
        }
        
        
        
        
    }
}


