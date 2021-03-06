import SwiftUI

struct NewTaskView: View {

    @StateObject private var viewModel = NewTaskViewModel()
    @State private var isImagePickerShown = false
    private var stringProvider = StringProvider()
    @Environment(\.presentationMode)
    private var presentationMode

    var body: some View {
        VStack(spacing: 40) {
            textField(name: stringProvider.taskName, value: $viewModel.name)
            textField(name: stringProvider.description, value: $viewModel.description)
            priorityPicker
            ImageView(image: $viewModel.image, isEditMode: .constant(true))
            if viewModel.image == nil {
                AddImageButton(showImagePicker: $isImagePickerShown)
            }
            Spacer()
            VStack {
                Text(stringProvider.mandatoryFieldsLegend)
                    .foregroundColor(.gray)
                Button {
                    viewModel.addTask()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    addButton
                }
            }
        }.padding()
            .sheet(isPresented: $isImagePickerShown) {
                ImagePicker(image: $viewModel.image)
            }
    }

    private func textField(name: String, value: Binding<String>) -> some View {
        VStack(alignment: .leading) {
            Text(name)
            TextField(stringProvider.enterText, text: value)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.black, lineWidth: 2)
                )
        }
    }

    private var priorityPicker: some View {
        VStack(alignment: .leading) {
            Text(stringProvider.priority)
            Picker(stringProvider.priority, selection: $viewModel.priority) {
                ForEach(TaskPriority.allCases) { priority in
                    Text(priority.localizedString())
                }
            }.pickerStyle(.segmented)
        }
    }

    private var addButton: some View {
        Text(stringProvider.add)
            .foregroundColor(viewModel.isValid ? .black : .gray)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(viewModel.isValid ? .black : .gray, lineWidth: 2)
            )
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView()
    }
}
