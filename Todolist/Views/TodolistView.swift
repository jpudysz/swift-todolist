import SwiftUI

struct TodolistView: View {
    @Binding var query: String
    @Binding var priority: Priority
    @StateObject var model: Todolist
    
    var body: some View {
        let selectedTodos = model.limitTo(query: query, priority: priority)

        VStack {
            SearchInput(query: $query)
            PriorityPicker(priority: $priority)
            List {
                ForEach(Array(selectedTodos.enumerated()), id: \.element.id) { index, todo in
                    let baseIndex = model.getTodoIndex(todo: todo)
                    
                    NavigationLink(destination: TodoDetailsView(todo: $model.todos[baseIndex])) {
                        TodoTile(todo: todo)
                            .onTapGesture {
                                withAnimation {
                                    model.toggleTodo(for: todo)
                                }
                            }
                    }
                    .listRowBackground(Color("BackgroundColor"))
                }
                .onDelete(perform: model.deleteItem)
            }
            .listStyle(.inset)
        }
        .animation(.default, value: priority)
        .animation(.default, value: query)
        .padding()
    }
}

struct TodolistView_Previews: PreviewProvider {
    static var previews: some View {
        TodolistView(
            query: .constant(""),
            priority: .constant(.unknown),
            model: .init(useMock: true)
        )
    }
}
