import Foundation
import SwiftUI
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

    func color() -> Color {
        switch self {
        case .critical:
                return .red
        case .high:
                return .orange
        case .medium:
                return .black
        case .low:
                return .green
        }
    }

    func iconName() -> String {
        switch self {
        case .critical:
            return "flame"
        case .high:
            return "chevron.up"
        case .medium:
            return "equal"
        case .low:
            return "chevron.down"
        }
    }
}
