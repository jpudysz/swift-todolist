import SwiftUI

struct AddTodoView: View {
    @State private var priority: Priority = .low
    @State private var text: String = ""
    @State private var isCompleted: Bool = false
    @Binding var isVisible: Bool
    @StateObject var model: Todolist
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("addtodo-base-section-header")) {
                    TextField(String(localized: "addtodo-base-section-text"), text: $text)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                    PriorityPicker(showDefaultOption: false, priority: $priority)
                }
                Section(header: Text("addtodo-other-section-header")) {
                    Toggle(String(localized: "addtodo-other-section-completed"), isOn: $isCompleted)
                }
            }
            Spacer()
            VStack {
                Button {
                    let newTodo = Todo(
                        text,
                        priority: priority,
                        isCompleted: isCompleted
                    )
                    
                    model.addTodo(todo: newTodo)
                    isVisible.toggle()
                } label: {
                    Text("common-save")
                        .frame(width: 200, height: 50)
                        .foregroundColor(.white)
                        .background(.primary)
                        .cornerRadius(8)
                }
                Button {
                    isVisible.toggle()
                } label: {
                    Text("common-cancel")
                        .frame(width: 200, height: 50)
                        .foregroundColor(.red)
                }
            }
            .padding(.top)
        }
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView(isVisible: .constant(true), model: Todolist(useMock: true))
    }
}
