import Foundation

public extension UserDefaults {
    func read<T: Codable>(
        _ type: T.Type,
        with key: String,
        usingDecoder decoder: JSONDecoder = JSONDecoder()
    ) -> T? {
        guard let data = self.value(forKey: key) as? Data else { return nil }
        return try? decoder.decode(type.self, from: data)
    }

    func set<T: Codable>(object: T, forKey key: String, usingEncoder encoder: JSONEncoder = JSONEncoder()) {
        guard let data = try? encoder.encode(object) else { return }
        self.set(data, forKey: key)
    }
}
