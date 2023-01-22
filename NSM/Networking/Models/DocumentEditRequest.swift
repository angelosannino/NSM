import Foundation

struct DocumentEditRequest<T: Firestoreable> {
    let document: T
    let data: [String: Any]
}
