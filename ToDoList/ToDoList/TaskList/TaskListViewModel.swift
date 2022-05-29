import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    @Published var tasks: [Task]
    var repository = DIContainer.repository
    var cancellables: Set<AnyCancellable> = []

    init(tasks: [Task] = []) {
        self.tasks = tasks
        repository.$tasks
            .sink { [unowned self] tasks in                
                self.tasks = tasks
            }
            .store(in: &cancellables)
    }

    func delete(task: Task) {
        repository.delete(task)
    }
}
