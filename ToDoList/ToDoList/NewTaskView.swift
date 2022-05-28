import SwiftUI

struct NewTaskView: View {
    var body: some View {
        VStack {

        }
    }


    @ViewBuilder
    func textField(name: String, value: Binding<String>) -> some View {
        VStack {
            Text(name)
            textField(name: "Введите текс", value: value)
        }
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView()
    }
}
