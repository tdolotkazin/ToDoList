import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    @Published var tasks: [Task]
    var repository = DIContainer.repository
    var cancellables: Set<AnyCancellable> = []

    init(tasks: [Task] = []) {
        self.tasks = tasks
    }

    func onAppear() {
        repository.$tasks
            .sink { [unowned self] _ in
                self.tasks = repository.tasks
            }
            .store(in: &cancellables)
    }
}
