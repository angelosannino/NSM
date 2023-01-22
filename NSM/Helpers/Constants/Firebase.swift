import Foundation

extension Constants {
    enum Firebase {}
}

extension Constants.Firebase {
    enum Collections {
        static let users = "Users"
        static let buttons = "Buttons"
        static let icons = "Icons"
    }

    enum Keys {
        static let id = "id"
        static let name = "name"
        static let surname = "surname"
        static let email = "email"
        static let username = "username"
        static let password = "password"
        static let buttons = "buttons"
        static let needsPasswordReset = "needsPasswordReset"
        static let type = "type"
        static let icon = "icon"
        static let link = "link"
        static let title = "title"
    }
}
