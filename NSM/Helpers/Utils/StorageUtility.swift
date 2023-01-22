import Foundation

struct StorageUtility {
    private static let userDefaults: UserDefaults = .standard

    private static var encoder: PropertyListEncoder {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        return encoder
    }

    private static var decoder: PropertyListDecoder {
        PropertyListDecoder()
    }

    static func save<T: Encodable>(_ object: T, forKey key: String) {
        do {
            let data = try encoder.encode(object)
            userDefaults.set(data, forKey: key)
        } catch { print(error.localizedDescription) }
    }

    static func object<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        do {
            guard let data = userDefaults.data(forKey: key) else { return nil }
            return try decoder.decode(type, from: data)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

    static func clearValue(forKey key: String) {
        userDefaults.removeObject(forKey: key)
    }
}
