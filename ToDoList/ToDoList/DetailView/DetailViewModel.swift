import Combine
import CoreText

class DetailViewModel: ObservableObject {

    @Published var task: Task
    @Published var isEditing = false
    @Published var name: String
    @Published var description: String
    @Published var priority: TaskPriority
    @Published var status: Bool

    var repository: TaskRepository = DIContainer.repository

    init(task: Task) {
        self.task = task
        name = task.name
        description = task.description ?? ""
        priority = task.priority
        status = task.isCompleted
    }

    func saveTask() {
        task.name = name
        task.description = description.isEmpty ? nil : description
        task.priority = priority
        task.isCompleted = status
        repository.saveTask(task: task)
    }
}
