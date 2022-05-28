struct MockTasks {
    static var tasks = [
        Task(name: "First task", priority: .critical, description: "Some description", isCompleted: true),
        Task(name: "Second task", priority: .high, description: "Another description"),
        Task(name: "Third task", priority: .medium, isCompleted: true),
        Task(name: "Fourth task", priority: .low, description: "Some very very very very looooooooong description")
    ]
}
