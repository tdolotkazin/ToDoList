import Combine
import Foundation

protocol TaskRepositoryProtocol {
    var tasks: [Task] { get }
    func saveTask(task: Task)
}

class TaskRepository: TaskRepositoryProtocol, ObservableObject {

    @Published var tasks = [Task]()
    let userDefaults = UserDefaults.standard
    private var cancellables: Set<AnyCancellable> = []
    private let constants = TaskRepositoryConstants()

    init() {
        self.tasks = userDefaults.read([Task].self, with: constants.tasksKey) ?? []
        $tasks
            .sink { [unowned self] tasks in
                self.userDefaults.set(object: tasks, forKey: constants.tasksKey)
            }
            .store(in: &cancellables)
    }

    func saveTask(task: Task) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else {
            tasks.append(task)
            return
        }
        tasks[index] = task
    }

    func delete(_ task: Task) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else { return }
        tasks.remove(at: index)
    }
}
