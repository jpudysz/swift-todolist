import SwiftUI

@main
struct TodolistApp: App {
    var body: some Scene {
        WindowGroup {
            AppView(model: Todolist(useMock: true))
                .environment(\.locale, .init(identifier: "en"))
        }
    }
}
