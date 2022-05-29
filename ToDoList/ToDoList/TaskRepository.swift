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

    init() {
        // TODO: Move key to constants
        self.tasks = userDefaults.read([Task].self, with: "tasks") ?? []
        $tasks
            .sink { [unowned self] tasks in
                self.userDefaults.set(object: tasks, forKey: "tasks")
            }
            .store(in: &cancellables)
    }

    deinit {
        print("Deinited")
    }

    func saveTask(task: Task) {
        print("Saving task")
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else {
            tasks.append(task)
            return
        }
        tasks[index] = task
    }
}
