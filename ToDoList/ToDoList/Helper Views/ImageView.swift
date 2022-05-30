import SwiftUI

struct ImageView: View {

    @Binding var image: UIImage?
    @Binding var isEditMode: Bool

    var body: some View {
        if let image = image {
            Section {
                HStack {
                    Spacer()
                    ZStack(alignment: .topTrailing) {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .border(.gray, width: 1)
                        if isEditMode {
                            Button {
                                self.image = nil
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 20))
                                    .offset(x: 10, y: -10)
                            }
                            .padding(10)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(image: .constant(UIImage(named: "testImage")), isEditMode: .constant(false))
    }
}
