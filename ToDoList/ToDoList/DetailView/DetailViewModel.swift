import Combine
import UIKit

class DetailViewModel: ObservableObject {

    @Published var task: Task
    @Published var isEditing = false
    @Published var name: String
    @Published var description: String
    @Published var priority: TaskPriority
    @Published var status: Bool
    @Published var image: UIImage?
    private var imageID: UUID?
    private var cancellables: Set<AnyCancellable> = []
    private var isLoading = false

    private var repository = DIContainer.repository
    private var imageRepository = DIContainer.imageRepository

    init(task: Task) {
        self.task = task
        name = task.name
        description = task.description ?? ""
        priority = task.priority
        status = task.isCompleted
        imageID = task.imageID
        $image
            .sink { [weak self] image in
                guard let image = image, self?.isLoading != true else {
                    return
                }
                self?.imageID = self?.imageRepository.save(image)
            }
            .store(in: &cancellables)

        guard let imageID = imageID else { return }
        imageRepository.loadImage(fileID: imageID)
            .receive(on: RunLoop.main)
            .sink { image in
                self.isLoading = true
                self.image = image
                self.isLoading = false
            }
            .store(in: &cancellables)
    }

    func saveTask() {
        task.name = name
        task.description = description.isEmpty ? nil : description
        task.priority = priority
        task.isCompleted = status
        task.imageID = imageID
        repository.saveTask(task: task)
    }
}
