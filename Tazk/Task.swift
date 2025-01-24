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
    private var createdAt: Date = Date.now
    private var dueDate: Date?
    private var isCompleted: Bool = false
    var priority: Priority?
    
    init(name: String, dueDate: Date?, priority: Priority?) {
        self.name = name
        self.dueDate = dueDate
        self.priority = priority
    }
    
}
