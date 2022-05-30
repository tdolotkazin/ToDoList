import SwiftUI

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                TaskListView(viewModel: TaskListViewModel())
                    .tabItem {
                        Label("Task List", systemImage: "list.dash")
                    }
                Statistics()
                    .tabItem {
                        Label("Stats", systemImage: "chart.pie.fill")
                    }
            }
        }
    }
}
