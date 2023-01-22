import Foundation

protocol ServiceProviderProtocol {
    func login(_ details: LoginDetails) async -> Result<Void, Error>
    func logOut() -> Result<Void, Error>
    func create(user details: LoginDetails) async -> Result<Void, Error>
    func updatePassword(with details: LoginDetails) async -> Result<Void, Error>
    func resetPassword(for email: String) async -> Result<Void, Error>
    func fetchButtons(for user: User) async -> Result<[LinkButton], Error>
    func fetchButtons() async -> Result<[LinkButton], Error>
    func fetchUsers() async -> Result<[User], Error>
    func add(user: User) async -> Result<Void, Error>
    func edit(user request: DocumentEditRequest<User>) async -> Result<Void, Error>
    func fetch(user email: String) async -> Result<User, Error>
    func delete(user: User) async -> Result<Void, Error>
    func add(button: LinkButton) async -> Result<Void, Error>
    func edit(button request: DocumentEditRequest<LinkButton>) async -> Result<Void, Error>
    func delete(button: LinkButton) async -> Result<Void, Error>
    func fetch(button id: String) async -> Result<LinkButton, Error>
    func fetchIcons() async -> Result<[String], Error>
    mutating func inject(firestore: FirestoreProviderProtocol, authorization: FirebaseAuthProvider)
}

struct ServiceProvider: ServiceProviderProtocol {
    private var firestore: FirestoreProviderProtocol?
    private var authorization: FirebaseAuthProviderProtocol?

    func login(_ details: LoginDetails) async -> Result<Void, Error> {
        await perform(authorization?.login, param: details)
    }

    func logOut() -> Result<Void, Error> {
        perform(authorization?.logOut)
    }

    func create(user details: LoginDetails) async -> Result<Void, Error> {
        await perform(authorization?.createUser, param: details)
    }

    func updatePassword(with details: LoginDetails) async -> Result<Void, Error> {
        await perform(authorization?.updatePassword, param: details)
    }

    func resetPassword(for email: String) async -> Result<Void, Error> {
        await perform(authorization?.resetPassword, param: email)
    }

    func fetchButtons(for user: User) async -> Result<[LinkButton], Error> {
        await perform(firestore?.getButtons, param: user.buttons)
    }

    func fetchButtons() async -> Result<[LinkButton], Error> {
        await perform(firestore?.getAllButtons)
    }

    func fetchUsers() async -> Result<[User], Error> {
        await perform(firestore?.getUsers)
    }

    func add(user: User) async -> Result<Void, Error> {
        await perform(firestore?.add, param: user)
    }

    func edit(user request: DocumentEditRequest<User>) async -> Result<Void, Error> {
        await perform(firestore?.edit, param: request)
    }

    func fetch(user email: String) async -> Result<User, Error> {
        await perform(firestore?.getUser, param: email)
    }

    func delete(user: User) async -> Result<Void, Error> {
        await perform(firestore?.delete, param: user)
    }

    func add(button: LinkButton) async -> Result<Void, Error> {
        await perform(firestore?.add, param: button)
    }

    func edit(button request: DocumentEditRequest<LinkButton>) async -> Result<Void, Error> {
        await perform(firestore?.edit, param: request)
    }

    func delete(button: LinkButton) async -> Result<Void, Error> {
        await perform(firestore?.delete, param: button)
    }

    func fetch(button id: String) async -> Result<LinkButton, Error> {
        await perform(firestore?.fetch, param: id)
    }

    func fetchIcons() async -> Result<[String], Error> {
        await perform(firestore?.fetchIcons)
    }

    mutating func inject(firestore: FirestoreProviderProtocol,
                         authorization: FirebaseAuthProvider) {
        self.firestore = firestore
        self.authorization = authorization
    }
}

private extension ServiceProvider {
    private func perform<T>(_ callback: (() async throws -> T)?,
                            defaultError: Error = ServiceError.generic) async -> Result<T, Error> {
        do {
            guard let result = try await callback?() else {
                print("❌ \(defaultError) ❌")
                return .failure(defaultError)
            }
            return .success(result)
        } catch {
            print("❌ \(error) ❌")
            return .failure(error)
        }
    }

    private func perform<T>(_ callback: (() throws -> T)?,
                            defaultError: Error = ServiceError.generic) -> Result<T, Error> {
        do {
            guard let result = try callback?() else {
                print("❌ \(defaultError) ❌")
                return .failure(defaultError)
            }
            return .success(result)
        } catch {
            print("❌ \(error) ❌")
            return .failure(error)
        }
    }

    private func perform<T, U>(_ callback: ((U) async throws -> T)?,
                               param: U,
                               defaultError: Error = ServiceError.generic) async -> Result<T, Error> {
        do {
            guard let result = try await callback?(param) else {
                print("❌ \(defaultError) ❌")
                return .failure(defaultError)
            }
            return .success(result)
        } catch {
            print("❌ \(error) ❌")
            return .failure(error)
        }
    }
}
