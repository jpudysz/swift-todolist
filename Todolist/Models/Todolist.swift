import Foundation
import SwiftUI

class Todolist: ObservableObject {
    @Published var todos: [Todo] = []
    
    init(useMock: Bool = false) {
        if (useMock) {
            todos = [
                Todo("Clean a house", priority: .medium),
                Todo("Ride a bike"),
                Todo("Watch a movie"),
                Todo("Pay the bills", priority: .high)
            ]
        }
    }
}
