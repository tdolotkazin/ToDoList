import Combine
import CoreText

class DetailViewModel: ObservableObject {

    @Published var task: Task

    var name: String {
        task.name
    }

    var description: String {
        task.description ?? ""
    }

    var priority: String {
        task.priority.rawValue
    }

    var status: String {
        task.isCompleted ? "Выполнено" : "Не выполнено"
    }

    init(task: Task) {
        self.task = task
    }
}
