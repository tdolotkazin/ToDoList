import SwiftUI

struct Statistics: View {

    @StateObject var viewModel: StatisticsViewModel = StatisticsViewModel()

    var body: some View {
        VStack {
            Text("Total: \(viewModel.tasks.count) tasks")
            BarChart()
        }
    }
}

struct BarChart: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.green)
            .frame(maxHeight: 50)
            .padding()
    }
}

struct Statistics_Previews: PreviewProvider {
    static var previews: some View {
        Statistics()
    }
}
