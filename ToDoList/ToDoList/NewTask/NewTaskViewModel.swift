import Combine

class NewTaskViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var description: String = ""
    @Published var priority: TaskPriority = .low
    var isValid: Bool {
        !name.isEmpty
    }
    var repository: TaskRepositoryProtocol = DIContainer.repository

    func addTask() {
        let task = Task(name: name, priority: priority, description: description.isEmpty ? nil : description)
        repository.saveTask(task: task)
    }
}
