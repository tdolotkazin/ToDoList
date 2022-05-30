import SwiftUI

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            TaskListView(viewModel: TaskListViewModel())
        }
    }
}
