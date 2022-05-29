import Combine
import CoreText

class DetailViewModel: ObservableObject {

    @Published var task: Task
    @Published var isEditing = true
    @Published var name: String
    @Published var description: String
    @Published var priority: TaskPriority
    @Published var status: Bool

    init(task: Task) {
        self.task = task
        name = task.name
        description = task.description ?? ""
        priority = task.priority
        status = task.isCompleted
    }

    func saveTask() {
        print("Save task")
    }
}
