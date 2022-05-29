import Foundation

public extension UserDefaults {
    func read<T: Codable>(
        _ type: T.Type,
        with key: String,
        usingDecoder decoder: JSONDecoder = JSONDecoder()
    ) -> T? {
        guard let data = self.value(forKey: key) as? Data else { return nil }
        // TODO: Handle errors
        return try? decoder.decode(type.self, from: data)
    }

    func set<T: Codable>(object: T, forKey key: String, usingEncoder encoder: JSONEncoder = JSONEncoder()) {
        // TODO: Handle errors
        guard let data = try? encoder.encode(object) else { return }
        self.set(data, forKey: key)
    }
}
