//
//  Item.swift
//  Tazk
//
//  Created by Sidney Silva Braz de Oliveira on 1/24/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
