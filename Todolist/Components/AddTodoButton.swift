import SwiftUI

struct AddTodoButton: View {    
    var body: some View {
        Circle()
            .frame(width: 60, height: 60)
            .foregroundColor(.accentColor)
            .overlay(
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
            )
            .shadow(radius: 4)
    }
}

struct AddTodoButton_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoButton()
    }
}
