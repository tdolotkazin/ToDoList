import Foundation

class TaskListViewModel: ObservableObject {
    var tasks: [Task]

    init(tasks: [Task] = []) {
        self.tasks = MockTasks.tasks
    }
}
