import Combine

class StatisticsViewModel: ObservableObject {
    @Published var tasks: [Task]
    var doneTasksCount: Int {
        tasks.filter { $0.isCompleted }.count
    }
    var repository = DIContainer.repository

    init() {
//        tasks = repository.tasks
        tasks = MockTasks.tasks
    }

    func taskCount(by priority: TaskPriority) -> Int {
        tasks.filter { $0.priority == priority }.count
    }
}
