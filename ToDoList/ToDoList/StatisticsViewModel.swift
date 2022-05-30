import Combine

class StatisticsViewModel: ObservableObject {
    @Published var tasks: [Task]
    var repository = DIContainer.repository

    init() {
//        tasks = repository.tasks
        tasks = MockTasks.tasks
    }
}
