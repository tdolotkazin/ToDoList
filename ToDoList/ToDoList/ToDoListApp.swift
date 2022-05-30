import SwiftUI

@main
struct ToDoListApp: App {

    var stringProvider = DIContainer.stringProvider
    var body: some Scene {
        WindowGroup {
            TabView {
                TaskListView()
                    .tabItem {
                        Label(stringProvider.taskList, systemImage: "list.dash")
                    }
                Statistics()
                    .tabItem {
                        Label(stringProvider.stats, systemImage: "chart.pie.fill")
                    }
            }
        }
    }
}
