import SwiftUI

struct DetailView: View {

    @StateObject var viewModel: DetailViewModel
    @State var width: CGFloat = 0

    var body: some View {
        List {
            textProperty(name: "Задача", value: $viewModel.name)
            textProperty(name: "Description", value: $viewModel.description)
            priority(value: $viewModel.priority)
            status(value: $viewModel.status)
            if viewModel.isEditing {
                buttons
            } else {
                Button {
                    viewModel.isEditing = true
                } label: {
                    Text("Редактировать")
                }
            }
        }.navigationTitle("Задача")
    }

    private func textProperty(name: String, value: Binding<String>) -> some View {
        Section {
            HStack {
                Text(name)
                Spacer()
                if viewModel.isEditing {
                    TextField("", text: value)
                        .multilineTextAlignment(.center)
                        .padding(6)
                        .foregroundColor(.white)
                        .background(.gray)
                        .cornerRadius(10)
                        .frame(width: width / 2)
                } else {
                    Text(value.wrappedValue)
                }
            }
            .overlay(
                GeometryReader { proxy -> Color in
                    width = proxy.size.width
                    return Color.clear
                })
        }
    }

    private func priority(value: Binding<TaskPriority>) -> some View {
        Section {
            if viewModel.isEditing {
                VStack(alignment: .leading) {
                    Text("Приоритет")
                    Picker("Приоритет", selection: value) {
                        ForEach(TaskPriority.allCases) { priority in
                            Text(priority.rawValue)
                        }
                    }.pickerStyle(.segmented)
                }
            } else {
                HStack {
                    Text("Приоритет")
                    Spacer()
                    Text(value.wrappedValue.rawValue)
                }
            }
        }
    }

    private func status(value: Binding<Bool>) -> some View {
        Section {
            if viewModel.isEditing {
                Toggle(isOn: value) {
                    Text("Выполнено")
                }
            } else {
                HStack {
                    Text("Статус")
                    Spacer()
                    Text(value.wrappedValue ? "Выполнено" : "Не выполнено")
                }
            }
        }
    }

    private var buttons: some View {
        Section {
            HStack {
                Button {
                    viewModel.saveTask()
                    viewModel.isEditing = false
                } label: {
                    Text("Сохранить")
                        .foregroundColor(.green)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.green, lineWidth: 2)
                        )
                }.buttonStyle(.plain)
                Spacer()
                Button {
                    viewModel.isEditing = false
                } label: {
                    Text("Отменить")
                        .foregroundColor(.red)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.red, lineWidth: 2)
                        )
                }.buttonStyle(.plain)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailViewModel(task: MockTasks.tasks.first!))
    }
}
