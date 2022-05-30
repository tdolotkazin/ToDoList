import Combine

class StatisticsViewModel: ObservableObject {
    @Published var tasks: [Task]
    var doneTasksCount: Int {
        tasks.filter { $0.isCompleted }.count
    }
    var repository = DIContainer.repository
    var cancellables: Set<AnyCancellable> = []

    init() {
        self.tasks = []
        repository.$tasks
            .sink { [unowned self] updatedTasks in
                self.tasks = updatedTasks
            }
            .store(in: &cancellables)
    }

    func taskCount(by priority: TaskPriority) -> Int {
        tasks.filter { $0.priority == priority }.count
    }
}
