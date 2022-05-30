import Foundation
struct Task: Identifiable, Codable {

    let id: UUID
    var name: String
    var priority: TaskPriority
    var description: String?
    var isCompleted: Bool
    var imageID: UUID?

    init(
        id: UUID = UUID(),
        name: String,
        priority: TaskPriority,
        description: String? = nil,
        isCompleted: Bool = false,
        imageID: UUID? = nil
    ) {
        self.id = id
        self.name = name
        self.priority = priority
        self.description = description
        self.isCompleted = isCompleted
        self.imageID = imageID
    }
}

enum TaskPriority: CaseIterable, Identifiable, Codable {
    var id: Self { self }

    case critical, high, medium, low
    func localizedString() -> String {
        switch self {
        case .critical:
            return StringProvider().critical
        case .high:
            return StringProvider().high
        case .medium:
            return StringProvider().medium
        case .low:
            return StringProvider().low
        }
    }
}
