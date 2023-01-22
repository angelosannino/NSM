import Foundation

extension User: Firestoreable {
    init?(_ data: [String: Any]) {
        guard let id = data[Constants.Firebase.Keys.id] as? String,
              let name = data[Constants.Firebase.Keys.name] as? String,
              let surname = data[Constants.Firebase.Keys.surname] as? String,
              let email = data[Constants.Firebase.Keys.email] as? String,
              let password = data[Constants.Firebase.Keys.password] as? String,
              let type = data[Constants.Firebase.Keys.type] as? String,
              let buttons = data[Constants.Firebase.Keys.buttons] as? [String],
              let needsPasswordReset = data[Constants.Firebase.Keys.needsPasswordReset] as? Bool else { return nil }
        self.id = id
        self.name = name
        self.surname = surname
        self.email = email
        self.password = password
        self.type = UserType(rawValue: type) ?? .guest
        self.buttons = buttons
        self.needsPasswordReset = needsPasswordReset
    }

    var data: [String: Any] {
        [
            Constants.Firebase.Keys.id: id,
            Constants.Firebase.Keys.name: name,
            Constants.Firebase.Keys.surname: surname,
            Constants.Firebase.Keys.email: email,
            Constants.Firebase.Keys.password: password,
            Constants.Firebase.Keys.type: type.rawValue,
            Constants.Firebase.Keys.needsPasswordReset: needsPasswordReset,
            Constants.Firebase.Keys.buttons: buttons
        ]
    }

    var identifier: String { id }
}
