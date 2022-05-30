import SwiftUI

struct AddImageButton: View {

    @Binding var showImagePicker: Bool
    var stringProvider = DIContainer.stringProvider

    var body: some View {
        HStack {
            Spacer()
            Button {
                showImagePicker = true
            } label: {
                Text(stringProvider.addPhoto)
                    .foregroundColor(.black)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.black, lineWidth: 2)
                    )
            }
            Spacer()
        }
    }
}

struct AddImageButton_Previews: PreviewProvider {
    static var previews: some View {
        AddImageButton(showImagePicker: .constant(false))
    }
}
