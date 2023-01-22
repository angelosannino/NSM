import Foundation
import FirebaseAuth

enum FirebaseAuthError: Error {
    case invalidUser
}

protocol FirebaseAuthProviderProtocol {
    func login(_ details: LoginDetails) async throws
    func logOut() throws
    func createUser(_ details: LoginDetails) async throws
    func updatePassword(with details: LoginDetails) async throws
    func resetPassword(for email: String) async throws
}

struct FirebaseAuthProvider: FirebaseAuthProviderProtocol {
    private let auth: Auth

    init(auth: Auth = Auth.auth()) {
        self.auth = auth
    }

    func login(_ details: LoginDetails) async throws {
        try await auth.signIn(withEmail: details.email, password: details.password)
    }

    func logOut() throws {
        try auth.signOut()
    }

    func createUser(_ details: LoginDetails) async throws {
        try await auth.createUser(withEmail: details.email, password: details.password)
    }

    func updatePassword(with details: LoginDetails) async throws {
        guard let user = auth.currentUser,
        user.email == details.email else { throw FirebaseAuthError.invalidUser }
        try await user.updatePassword(to: details.password)
    }

    func resetPassword(for email: String) async throws {
        try await auth.sendPasswordReset(withEmail: email)
    }
}
