import SwiftUI

struct Statistics: View {

    @StateObject var viewModel: StatisticsViewModel = StatisticsViewModel()
    var stringProvider = DIContainer.stringProvider

    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .center) {
                Text(stringProvider.totalTasks +  "\(viewModel.tasks.count)")
                    .font(.title)
                doneChart(width: proxy.size.width - 32)
                Text(stringProvider.tasksByPriorities)
                    .font(.title)
                HStack {
                    priorityChart
                    Spacer()
                }
                .padding()
            }
        }
    }

    @ViewBuilder
    func doneChart(width: CGFloat) -> some View {
        let doneTasksCount = viewModel.doneTasksCount
        let totalTasksCount = viewModel.tasks.count
        VStack {
            doneChartHeader
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

    private var doneChartHeader: some View {
        HStack {
            Text(stringProvider.done + ": \(viewModel.doneTasksCount)")
            Spacer()
            Text(stringProvider.notDone + ": \(viewModel.tasks.count - viewModel.doneTasksCount)")
        }
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
