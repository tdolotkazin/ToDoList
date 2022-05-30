import SwiftUI

struct Statistics: View {

    @StateObject var viewModel: StatisticsViewModel = StatisticsViewModel()

    var body: some View {
        VStack(alignment: .center) {
            Text("Total: \(viewModel.tasks.count) tasks")
                .font(.title)
            doneChart
            Text("Tasks by priorities")
                .font(.title)
            HStack {
                priorityChart
                Spacer()
            }
            .padding()
        }
    }

    @ViewBuilder
    var doneChart: some View {
        let width: CGFloat = 300
        let doneTasksCount = viewModel.doneTasksCount
        let totalTasksCount = viewModel.tasks.count
        VStack {
            HStack {
                Text("Done: \(doneTasksCount)")
                Spacer()
                Text("Not done: \(totalTasksCount - doneTasksCount)")
            }
            .frame(width: width)
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: width, height: 30)
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: width / CGFloat(totalTasksCount) * CGFloat(doneTasksCount), height: 30)
            }
            .cornerRadius(10)
        }
        .padding()
    }

    @ViewBuilder
    var priorityChart: some View {
        let totalTasksCount = viewModel.tasks.count
        let width: CGFloat = 300
        VStack(alignment: .leading) {
            ForEach(TaskPriority.allCases) { priority in
                let count = viewModel.taskCount(by: priority)
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: width / CGFloat(totalTasksCount) * CGFloat(count), height: 30)
                        .foregroundColor(priority.color())
                    Text(priority.localizedString() + ": \(count)")
                }
            }
        }
    }
}

struct Statistics_Previews: PreviewProvider {
    static var previews: some View {
        Statistics()
    }
}
