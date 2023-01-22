import Foundation

protocol Firestoreable {
    init?(_ data: [String: Any])
    var data: [String: Any] { get }
    var identifier: String { get }
}
