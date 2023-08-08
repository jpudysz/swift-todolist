import Foundation
import SwiftUI

class Todolist: ObservableObject {
    @Published var todos: [Todo] = []
    
    convenience init(useMock: Bool = false) {
        let todos = !useMock
            ? []
            : [
                Todo("Clean a house", priority: .medium),
                Todo("Ride a bike"),
                Todo("Watch a movie"),
                Todo("Pay the bills", priority: .high)
            ]
        
        self.init(todos: todos)
    }
    
    init(todos: [Todo]) {
        self.todos = todos
    }
}
