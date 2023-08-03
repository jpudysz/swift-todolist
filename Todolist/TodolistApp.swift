import SwiftUI

@main
struct TodolistApp: App {
    var body: some Scene {
        WindowGroup {
            AppView(model: Todolist(useMock: true))
        }
    }
}
