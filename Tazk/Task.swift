//
//  Task.swift
//  Tazk
//
//  Created by Sidney Silva Braz de Oliveira on 1/24/25.
//

import Foundation
import SwiftData

enum Priority: String, Codable {
    case high
    case medium
    case low
    case none
}

@Model
final class Task {
    var id: UUID = UUID()
    var name: String
    var createdAt: Date = Date.now
    var dueDate: Date?
    var dueTime: Date?
    var isCompleted: Bool = false
    var priority: Priority?
    
    init(name: String, dueDate: Date?, dueTime: Date?, priority: Priority?) {
        self.name = name
        self.dueDate = dueDate
        self.dueTime = dueTime
        self.priority = priority
    }
    
}
