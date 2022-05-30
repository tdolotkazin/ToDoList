import Combine
import Foundation

class TaskRepository: ObservableObject {

    @Published var tasks = [Task]()
    private let userDefaults = UserDefaults.standard
    private var cancellables: Set<AnyCancellable> = []
    private let constants = TaskRepositoryConstants()
    private let imageRepository = DIContainer.imageRepository

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
        if let imageID = tasks[index].imageID {
            imageRepository.delete(fileId: imageID)
        }
        tasks.remove(at: index)
    }
}
