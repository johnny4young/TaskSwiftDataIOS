//
//  Item.swift
//  TaskSwiftDataIOS
//
//  Created by Johnny Young on 17/09/24.
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
