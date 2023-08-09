import SwiftUI

struct TodoDetailsView: View {
    @Binding var todo: Todo
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                HStack {
                    Checkbox(isSelected: $todo.isCompleted)
                    Text(todo.text)
                        .font(.title2)
                        .bold()
                }
                .padding(.top, 50)
                .padding(.bottom, todo.imageURI != nil ? 0 : 40)
                TodoImage(imageURI: todo.imageURI)
                TodoProperty(
                    label: String(localized: "priority"),
                    value: todo.priority.rawValue.capitalized,
                    systemImage: "p.square"
                )
                TodoProperty(
                    label: String(localized: "common-deadline"),
                    value: todo.deadline != nil
                        ? todo.deadline!.formatted()
                        : "-",
                    systemImage: "clock.arrow.circlepath"
                )
                TodoProperty(
                    label: String(localized: "common-created-at"),
                    value: todo.createdAt.formatted(),
                    systemImage: "clock"
                )
                TodoProperty(
                    label: String(localized: "common-modified-at"),
                    value: todo.lastModified.formatted(),
                    systemImage: "clock.badge"
                )
                TodoProperty(
                    label: String(localized: "common-completed"),
                    value: todo.isCompleted
                        ? String(localized: "common-yes")
                        : String(localized: "common-no"),
                    systemImage: "app.badge.checkmark"
                )
                Spacer()
            }
            .padding()
            .navigationTitle("Task Details")
        }
    }
}

struct TodoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailsView(todo: .constant(Todo("Do something magical")))
    }
}
