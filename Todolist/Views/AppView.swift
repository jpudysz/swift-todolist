import SwiftUI

struct AppView: View {
    @State private var query: String = ""
    @State private var priority: Priority = .unknown
    @StateObject private var model: Todolist
    
    var body: some View {
        NavigationView {
            TodolistView(
                query: $query,
                priority: $priority,
                model: model
            )
            .navigationTitle(String(localized: "my-todos"))
        }
    }

    init(model: Todolist) {
        _model = StateObject(wrappedValue: model)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(model: Todolist(useMock: true))
    }
}
