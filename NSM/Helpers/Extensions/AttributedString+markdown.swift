import Foundation

extension AttributedString {
    static func markdown(_ string: String) -> AttributedString {
        do {
            return try AttributedString(markdown: string)
        } catch {
            return AttributedString(Constants.emptyString)
        }
    }
}
