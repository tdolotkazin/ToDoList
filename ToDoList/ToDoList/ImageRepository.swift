import Combine
import SwiftUI

class ImageRepository: ObservableObject {

    private var documentDirectory: URL

    init() {
        self.documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }

    func save(_ image: UIImage) -> UUID? {
        let fileID = UUID()
        let fileURL = documentDirectory.appendingPathComponent(fileID.uuidString)
        guard let data = image.jpegData(compressionQuality: 1) else { return nil }
        do {
            try data.write(to: fileURL)
            return fileID
        } catch {
            return nil
        }
    }

    func loadImage(fileID: UUID) -> Future<UIImage?, Never> {
        return Future { promise in
            DispatchQueue.global(qos: .userInitiated).async {
                let imageURL = self.documentDirectory.appendingPathComponent(fileID.uuidString)
                let image = UIImage(contentsOfFile: imageURL.path)
                promise(.success(image))
            }
        }
    }

    func delete(fileId: UUID) {
        let fileURL = documentDirectory.appendingPathComponent(fileId.uuidString)
        try? FileManager.default.removeItem(at: fileURL)
    }
}
