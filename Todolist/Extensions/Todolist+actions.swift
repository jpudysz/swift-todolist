import Foundation

extension Todolist {
    func limitTo(query: String, priority: Priority) -> [Todo] {
        let filter: (query: String, priority: Priority) = (query, priority)

        switch filter {
        case (let query, let priority) where query.isEmpty && priority == .unknown:
            return todos
        case (let query, let priority) where query.isEmpty:
            return todos.filter {
                $0.priority == priority
            }
        case (let query, let priority) where priority == .unknown:
            return todos.filter {
                $0.text.lowercased().contains(query.lowercased())
            }
        case (let query, let priority):
            return todos.filter {
                $0.priority == priority && $0.text.lowercased().contains(query.lowercased())
            }
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
    
    func toggleTodo(for index: Int) {
        todos[index].isCompleted.toggle()
    }
}
