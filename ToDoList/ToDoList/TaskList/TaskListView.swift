import SwiftUI

struct TaskListView: View {

    @StateObject var viewModel: TaskListViewModel = TaskListViewModel()
    private var stringProvider = DIContainer.stringProvider

    var body: some View {
        NavigationView {
            VStack {
                List {
                    NavigationLink {
                        NewTaskView()
                    } label: {
                        Text(stringProvider.addNewTask)
                    }
                    ForEach(viewModel.tasks) { task in
                        NavigationLink {
                            DetailView(viewModel: DetailViewModel(task: task))
                        } label: {
                            taskView(for: task)
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                viewModel.delete(task: task)
                            } label: {
                                Image(systemName: "arrow.up.bin.fill")
                                    .foregroundColor(.white)
                            }
                        }
                    }

                }.navigationTitle(stringProvider.taskList)
            }
        }
    }

    @ViewBuilder
    private func taskView(for task: Task) -> some View {
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
            Image(systemName: task.priority.iconName())
                .foregroundColor(task.priority.color())
                .font(.system(size: 22))
            statusView(for: task.isCompleted)

        }
        .frame(minHeight: 44)
    }

    @ViewBuilder
    private func statusView(for isCompleted: Bool) -> some View {
        Image(systemName: isCompleted ? "checkmark.square" : "square")
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
