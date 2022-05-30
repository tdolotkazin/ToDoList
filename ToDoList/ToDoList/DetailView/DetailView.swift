import SwiftUI

struct DetailView: View {

    @StateObject var viewModel: DetailViewModel
    @State var width: CGFloat = 0
    var stringProvider = StringProvider()
    @State var isImagePickerShown = false

    var body: some View {
        List {
            textProperty(name: stringProvider.task, value: $viewModel.name)
            textProperty(name: stringProvider.description, value: $viewModel.description)
            priority(value: $viewModel.priority)
            status(value: $viewModel.status)
            Section {
                ImageView(image: $viewModel.image, isEditMode: $viewModel.isEditing)
                if viewModel.image == nil && viewModel.isEditing {
                    AddImageButton(showImagePicker: $isImagePickerShown)
                }
            }
            if viewModel.isEditing {
                buttons
            } else {
                Button {
                    viewModel.isEditing = true
                } label: {
                    Text(stringProvider.edit)
                }
            }
        }.navigationTitle(stringProvider.task)
            .sheet(isPresented: $isImagePickerShown) {
                ImagePicker(image: $viewModel.image)
            }
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
                    Text(stringProvider.priority)
                    Picker(stringProvider.priority, selection: value) {
                        ForEach(TaskPriority.allCases) { priority in
                            Text(priority.localizedString())
                        }
                    }.pickerStyle(.segmented)
                }
            } else {
                HStack {
                    Text(stringProvider.priority)
                    Spacer()
                    Text(value.wrappedValue.localizedString())
                }
            }
        }
    }

    private func status(value: Binding<Bool>) -> some View {
        Section {
            if viewModel.isEditing {
                Toggle(isOn: value) {
                    Text(stringProvider.done)
                }
            } else {
                HStack {
                    Text(stringProvider.status)
                    Spacer()
                    Text(value.wrappedValue ? stringProvider.done : stringProvider.notDone)
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
                    Text(stringProvider.save)
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
                    Text(stringProvider.cancel)
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
