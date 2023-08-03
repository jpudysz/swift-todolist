import Foundation

extension Todolist {
    private func sortByCompleted(lhs: Todo, rhs: Todo) -> Bool {
        rhs.isCompleted
    }
    
    func limitTo(query: String, priority: Priority) -> [Todo] {
        let filter: (query: String, priority: Priority) = (query, priority)

        switch filter {
        case (let query, let priority) where query.isEmpty && priority == .unknown:
            return todos.sorted(by: sortByCompleted)
        case (let query, let priority) where query.isEmpty:
            return todos.filter {
                    $0.priority == priority
                }
                .sorted(by: sortByCompleted)
        case (let query, let priority) where priority == .unknown:
            return todos.filter {
                    $0.text.lowercased().contains(query.lowercased())
                }
                .sorted(by: sortByCompleted)
        case (let query, let priority):
            return todos.filter {
                    $0.priority == priority && $0.text.lowercased().contains(query.lowercased())
                }
                .sorted(by: sortByCompleted)
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
    
    func toggleTodo(for element: Todo) {
        let targetTodoIndex = todos.firstIndex {
            $0.id == element.id
        }
        
        guard let index = targetTodoIndex, let _ = todos[index] as Todo? else {
            return
        }
        
        todos[index].isCompleted.toggle()
    }
    
    func addTodo(todo: Todo) {
        todos.append(todo)
    }
}
