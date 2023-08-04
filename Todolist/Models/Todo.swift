import Foundation

struct Todo: Identifiable, Equatable {
    let id: UUID
    let createdAt: Date
    
    var text: String {
        didSet {
            lastModified = Date()
        }
    }
    var isCompleted: Bool {
        didSet {
            lastModified = Date()
        }
    }
    var priority: Priority {
        didSet {
            lastModified = Date()
        }
    }
    var lastModified: Date
    
    init(_ text: String, priority: Priority = .unknown) {
        self.id = UUID()
        self.createdAt = Date()
        self.text = text
        self.isCompleted = false
        self.priority = priority
        self.lastModified = self.createdAt
    }
    
    init(_ text: String, priority: Priority, isCompleted: Bool) {
        self.id = UUID()
        self.createdAt = Date()
        self.text = text
        self.isCompleted = isCompleted
        self.priority = priority
        self.lastModified = self.createdAt
    }
}
