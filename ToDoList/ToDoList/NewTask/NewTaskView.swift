import SwiftUI

struct NewTaskView: View {

    @StateObject var viewModel = NewTaskViewModel()
    @Environment(\.presentationMode)
    private var presentationMode

    var body: some View {
        VStack(spacing: 40) {
            textField(name: "Название задачи *", value: $viewModel.name)
            textField(name: "Описание", value: $viewModel.description)
            priorityPicker
            Spacer()
            VStack {
                Text("* - обязательные поля для заполнения")
                    .foregroundColor(.gray)
                Button {
                    viewModel.addTask()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    addButton
                }
            }

        }.padding()
    }

    private func textField(name: String, value: Binding<String>) -> some View {
        VStack(alignment: .leading) {
            Text(name)
            TextField("Введите текст", text: value)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.black, lineWidth: 2)
                )
        }
    }

    private var priorityPicker: some View {
        VStack(alignment: .leading) {
            Text("Приоритет")
            Picker("Приоритет", selection: $viewModel.priority) {
                ForEach(TaskPriority.allCases) { priority in
                    Text(priority.rawValue)
                }
            }.pickerStyle(.segmented)
        }
    }

    private var addButton: some View {
        Text("Добавить")
            .foregroundColor(viewModel.isValid ? .black : .gray)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(viewModel.isValid ? .black : .gray, lineWidth: 2)
            )
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static let repository = MockTaskRepository()
    static var previews: some View {
        NewTaskView()
            .environmentObject(repository)
    }
}
