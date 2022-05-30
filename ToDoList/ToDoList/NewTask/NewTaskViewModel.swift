import Combine
import UIKit

class NewTaskViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var description: String = ""
    @Published var priority: TaskPriority = .low
    @Published var image: UIImage?

    var isValid: Bool {
        !name.isEmpty
    }
    private var repository = DIContainer.repository
    private var imageRepository = DIContainer.imageRepository

    func addTask() {
        var imageID: UUID?
        if let image = image {
            imageID = imageRepository.save(image)
        }
        let task = Task(
            name: name,
            priority: priority,
            description: description.isEmpty ? nil : description,
            imageID: imageID
        )
        repository.saveTask(task: task)
    }
}
