import Combine
import CoreText

class DetailViewModel: ObservableObject {

    @Published var task: Task
    @Published var isEditing = false
    @Published var name: String
    @Published var description: String
    @Published var priority: TaskPriority
    @Published var status: Bool

    var repository: TaskRepositoryProtocol = DIContainer.repository

    init(task: Task) {
        self.task = task
        name = task.name
        description = task.description ?? ""
        priority = task.priority
        status = task.isCompleted
    }

    func saveTask() {
        repository.saveTask(task: task)
    }
}
