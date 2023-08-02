import Foundation

struct Todo: Identifiable, Equatable {
    let id: UUID
    let createdAt: Date
    
    var text: String
    var isCompleted: Bool
    var priority: Priority
    var lastModified: Date
    
    init(_ text: String, priority: Priority = .unknown) {
        self.id = UUID()
        self.createdAt = Date()
        self.text = text
        self.isCompleted = false
        self.priority = priority
        self.lastModified = self.createdAt
    }
}
