import Foundation
import SwiftData

@Model
final class Item {
    var id: UUID
    var name: String
    var createdAt: Date
    
    init(name: String) {
        self.id = UUID()
        self.name = name
        self.createdAt = Date()
    }
}

@Model
final class User {
    var id: UUID
    var name: String
    var email: String
    var items: [Item]
    
    init(name: String, email: String) {
        self.id = UUID()
        self.name = name
        self.email = email
        self.items = []
    }
}
