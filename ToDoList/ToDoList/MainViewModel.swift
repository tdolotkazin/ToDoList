import Foundation

class MainViewModel: ObservableObject {
    var tasks: [Task]

    init(tasks: [Task] = []) {
        self.tasks = tasks
    }
}
