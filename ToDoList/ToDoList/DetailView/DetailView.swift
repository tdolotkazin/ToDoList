import SwiftUI

struct DetailView: View {

    @StateObject var viewModel: DetailViewModel

    var body: some View {
        List {
            property(name: "Задача", value: viewModel.name)
            property(name: "Description", value: viewModel.description)
            property(name: "Приоритет", value: viewModel.priority)
            property(name: "Статус", value: viewModel.status)
            Button {

            } label: {
                Text("Редактировать")
            }

        }.navigationTitle("Задача")
    }

    @ViewBuilder
    private func property(name: String, value: String) -> some View {
        Section {
            HStack {
                Text(name)
                Spacer()
                Text(value)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailViewModel(task: MockTasks.tasks.first!))
    }
}
