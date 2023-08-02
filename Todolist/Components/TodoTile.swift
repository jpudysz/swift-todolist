import SwiftUI

struct TodoTile: View {
    var todo: Todo
    
    var body: some View {
        /*@START_MENU_TOKEN@*/Text(todo.text)/*@END_MENU_TOKEN@*/
            .strikethrough(todo.isCompleted)
    }
}

struct TodoTile_Previews: PreviewProvider {
    static var previews: some View {
        TodoTile(todo: Todo("Do a dishes"))
    }
}
