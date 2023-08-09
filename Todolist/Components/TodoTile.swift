import SwiftUI

struct TodoTile: View {
    var todo: Todo
    private var isSoon: Bool {
        get {
            if let deadline = todo.deadline {
                return Date.now.addingTimeInterval(3600 * 6) >= deadline
            }
            
            return false
        }
    }
    
    var body: some View {
        HStack {
            Circle()
                .fill(isSoon ? .red : .gray)
                .frame(width: 10, height: 10)
            /*@START_MENU_TOKEN@*/Text(todo.text)/*@END_MENU_TOKEN@*/
                .strikethrough(todo.isCompleted)
        }
    }
}

struct TodoTile_Previews: PreviewProvider {
    static var previews: some View {
        TodoTile(todo: Todo("Do a dishes"))
    }
}
