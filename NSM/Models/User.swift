import SwiftUI

enum UserType: String, Codable, Identifiable, CaseIterable, Hashable {
    var id: String { rawValue }

    case admin = "admin"
    case employee = "employee"
    case customer = "customer"
    case guest = "guest"

    var localized: String {
        switch self {
        case .admin: return i18n.UserTypes.admin
        case .employee: return i18n.UserTypes.employee
        case .customer: return i18n.UserTypes.customer
        case .guest: return i18n.UserTypes.guest
        }
    }

    var icon: String {
        switch self {
        case .admin: return Constants.Icons.admin
        case .employee: return Constants.Icons.employee
        case .customer: return Constants.Icons.customer
        case .guest: return Constants.Icons.guest
        }
    }
}

struct User: Identifiable, Equatable, Codable, Hashable {
    var id: String
    let name: String
    let surname: String
    let email: String
    let password: String
    let type: UserType
    let buttons: [String]
    let needsPasswordReset: Bool

    init(id: String = UUID().uuidString,
         name: String,
         surname: String,
         email: String,
         password: String = Constants.defaultUserPassword,
         type: UserType,
         buttons: [String] = [],
         needsPasswordReset: Bool = true) {
        self.id = id
        self.name = name
        self.surname = surname
        self.email = email
        self.password = password
        self.type = type
        self.buttons = buttons
        self.needsPasswordReset = needsPasswordReset
    }
}

extension User {
    static var sample: User {
        User(name: "Sample", surname: "User", email: "sample.user@nauticsm.com", password: "password1", type: .employee)
    }
}

extension User {
    var fullName: String {
        [name, surname].joined(separator: Constants.emptySpace)
    }

    var image: Image {
        switch type {
        case .admin: return Image(systemName: Constants.Icons.admin)
        case .employee: return Image(systemName: Constants.Icons.employee)
        case .customer: return Image(systemName: Constants.Icons.customer)
        case .guest: return Image(systemName: Constants.Icons.guest)
        }
    }

    var icon: String {
        switch type {
        case .admin: return Constants.Icons.admin
        case .employee: return Constants.Icons.employee
        case .customer: return Constants.Icons.customer
        case .guest: return Constants.Icons.guest
        }
    }
}
