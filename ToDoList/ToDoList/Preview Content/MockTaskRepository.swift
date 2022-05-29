import Foundation

class MockTaskRepository: TaskRepositoryProtocol, ObservableObject {

    var tasks = MockTasks.tasks

    func saveTask(task: Task) {
        print("Save task")
    }
}
