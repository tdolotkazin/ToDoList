import Foundation
struct Task: Identifiable, Codable {

    let id: UUID
    var name: String
    var priority: TaskPriority
    var description: String?
    var isCompleted: Bool

    init(
        id: UUID = UUID(),
        name: String,
        priority: TaskPriority,
        description: String? = nil,
        isCompleted: Bool = false
    ) {
        self.id = id
        self.name = name
        self.priority = priority
        self.description = description
        self.isCompleted = isCompleted
    }
}

enum TaskPriority: String, CaseIterable, Identifiable, Codable {
    var id: Self { self }

    case critical = "Критический"
    case high = "Высокий"
    case medium = "Средний"
    case low = "Низкий"
}
