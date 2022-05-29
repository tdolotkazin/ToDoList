import Combine

class NewTaskViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var description: String = ""
    @Published var priority: TaskPriority = .low
    var isValid: Bool {
        !name.isEmpty
    }

    func addTask() {
        print("Add task")
    }
}
