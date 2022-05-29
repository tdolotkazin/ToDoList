import SwiftUI

struct MainView: View {

    @StateObject var viewModel: MainViewModel

    var body: some View {
        NavigationView {
            VStack {
                List {
                    NavigationLink {
                        NewTaskView()
                    } label: {
                        Text("Добавить новую задачу")
                    }
                    ForEach(viewModel.tasks) { task in
                        taskView(for: task)
                    }
                }.navigationTitle("Список задач")
            }
        }

    }

    @ViewBuilder
    func taskView(for task: Task) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.name)
                    .bold()
                if let description = task.description {
                    Text(description)
                        .lineLimit(2)
                }
            }
            Spacer()
            priorityView(for: task.priority)
                .font(.system(size: 22))
            statusView(for: task.isCompleted)

        }
        .frame(minHeight: 44)
    }

    @ViewBuilder
    func priorityView(for priority: TaskPriority) -> some View {
        switch priority {
            case .critical:
                Image(systemName: "flame")
                    .foregroundColor(.red)
            case .high:
                Image(systemName: "chevron.up")
                    .foregroundColor(.orange)
            case .medium:
                Image(systemName: "equal")
                //                    .foregroundColor(.black)
            case .low:
                Image(systemName: "chevron.down")
                    .foregroundColor(.green)
        }
    }

    @ViewBuilder
    func statusView(for isCompleted: Bool) -> some View {
        Image(systemName: isCompleted ? "checkmark.square" : "square")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(tasks: MockTasks.tasks))
    }
}
