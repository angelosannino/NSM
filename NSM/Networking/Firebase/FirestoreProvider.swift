import Foundation
import FirebaseFirestore

enum FirestoreError: Error {
    case documentNotFound
    case documentAlreadyExists
    case documentIsReferenced
}

protocol FirestoreProviderProtocol {
    func getUser(_ email: String) async throws -> User
    func getUsers() async throws -> [User]
    func getButtons(_ buttons: [String]) async throws -> [LinkButton]
    func getAllButtons() async throws -> [LinkButton]
    func add(user: User) async throws
    func edit(user request: DocumentEditRequest<User>) async throws
    func delete(user: User) async throws
    func add(button: LinkButton) async throws
    func edit(button request: DocumentEditRequest<LinkButton>) async throws
    func delete(button: LinkButton) async throws
    func fetch(button id: String) async throws -> LinkButton
    func fetchIcons() async throws -> [String]
}

struct FirestoreProvider: FirestoreProviderProtocol {
    private let db: Firestore

    init(db: Firestore = Firestore.firestore()) {
        self.db = db
    }

    func getUser(_ email: String) async throws -> User {
        guard let user: User = try await db
            .users
            .whereField(Constants.Firebase.Keys.email, isEqualTo: email)
            .getDocuments()
            .first else { throw FirestoreError.documentNotFound }
        return user
    }

    func getUsers() async throws -> [User] {
        try await db
            .users
            .getDocuments()
    }

    func getButtons(_ buttons: [String] = []) async throws -> [LinkButton] {
        guard !buttons.isEmpty else { return [] }
        return try await db
            .buttons
            .getFilteredDocuments(key: Constants.Firebase.Keys.id, values: buttons)
    }

    func getAllButtons() async throws -> [LinkButton] {
        try await db
            .buttons
            .getDocuments()
    }

    func add(user: User) async throws {
        let collection = db.users
        guard try await !collection.contains(user, forKey: Constants.Firebase.Keys.email) else { throw FirestoreError.documentAlreadyExists }
        try await collection.addDocument(user)
    }

    func edit(user request: DocumentEditRequest<User>) async throws {
        let collection = db.users
        guard try await collection.contains(request.document, forKey: Constants.Firebase.Keys.email) else { throw FirestoreError.documentNotFound }
        try await collection.editDocument(request.document, data: request.data)
    }

    func delete(user: User) async throws {
        let collection = db.users
        guard try await collection.contains(user, forKey: Constants.Firebase.Keys.email) else { throw FirestoreError.documentNotFound }
        try await collection.deleteDocument(user)
    }

    func add(button: LinkButton) async throws {
        let collection = db.buttons
        guard try await !collection.contains(button) else { throw FirestoreError.documentAlreadyExists }
        try await collection.addDocument(button)
    }

    func edit(button request: DocumentEditRequest<LinkButton>) async throws {
        let collection = db.buttons
        guard try await collection.contains(request.document) else { throw FirestoreError.documentNotFound }
        try await collection.editDocument(request.document, data: request.data)
    }

    func delete(button: LinkButton) async throws {
        let collection = db.buttons
        guard try await collection.contains(button) else { throw FirestoreError.documentNotFound }
        guard try await db.users.references(button, inArray: Constants.Firebase.Keys.buttons) else { throw FirestoreError.documentIsReferenced }
        try await collection.deleteDocument(button)
    }

    func fetch(button id: String) async throws -> LinkButton {
        guard let button: LinkButton = try await db
            .collection(Constants.Firebase.Collections.buttons)
            .whereField(Constants.Firebase.Keys.id, isEqualTo: id)
            .getDocuments()
            .first else { throw FirestoreError.documentNotFound }
        return button
    }

    func fetchIcons() async throws -> [String] {
        try await db
            .collection(Constants.Firebase.Collections.icons)
            .getDocuments()
            .documents
            .map { $0.data() }
            .compactMap { $0[Constants.Firebase.Keys.name] as? String }
    }
}

private extension CollectionReference {
    func addDocument<T: Firestoreable>(_ document: T,
                                       merge: Bool = false) async throws {
        try await self.document(document.identifier).setData(document.data, merge: merge)
    }

    func editDocument<T: Firestoreable>(_ document: T, data: [String: Any]) async throws {
        try await self.document(document.identifier).updateData(data)
    }

    func deleteDocument<T: Firestoreable>(_ document: T) async throws {
        try await self.document(document.identifier).delete()
    }

//    func filter(key: String, value: [String]) -> Query {
//        guard !value.isEmpty else {
//            return self
//        }
//        return self.whereField(key, in: value)
//    }
}

private extension Query {
    func getDocuments<T: Firestoreable>() async throws -> [T] {
        try await self.getDocuments()
            .documents
            .map { $0.data() }
            .compactMap(T.init)
    }

    func getFilteredDocuments<T: Firestoreable, U>(key: String, values: [U], filterMaxSize: Int = 10) async throws -> [T] {
        try await values
            .chunked(into: filterMaxSize)
            .asyncReduce(into: [T]()) {
                let docs: [T] = try await self
                    .whereField(key, in: $1)
                    .getDocuments()
                $0.append(contentsOf: docs)
            }
//        var results: [T] = []
//        let chunked = value.chunked(into: 10)
//        for chunk in chunked {
//            let docs: [T] = try await self
//                .whereField(key, in: chunk)
//                .getDocuments()
//            results.append(contentsOf: docs)
//        }
//        return results
    }

    func contains<T: Firestoreable>(_ document: T,
                                    forKey key: String = Constants.Firebase.Keys.id) async throws -> Bool {
        guard let field = document.data[key] as? String else { return false }
        return try await self
            .whereField(key, isEqualTo: field)
            .getDocuments()
            .documents
            .isEmpty == false
    }

    func contains<T: Firestoreable, U>(_ document: T,
                                       forKey key: String,
                                       ofType: U) async throws -> Bool {
        guard let field = document.data[key] as? U else { return false }
        return try await self
            .whereField(key, isEqualTo: field)
            .getDocuments()
            .documents
            .isEmpty == false
    }

    func references<T: Firestoreable>(_ document: T,
                                      identifiedBy id: String = Constants.Firebase.Keys.id,
                                      atKey key: String) async throws -> Bool {
        try await self
            .whereField(key, isEqualTo: document.data[id] as Any)
            .getDocuments()
            .documents
            .isEmpty
    }

    func references<T: Firestoreable>(_ document: T,
                                      identifiedBy id: String = Constants.Firebase.Keys.id,
                                      inArray array: String) async throws -> Bool {
        try await self
            .whereField(array, arrayContains: document.data[id] as Any)
            .getDocuments()
            .documents
            .isEmpty
    }
}
