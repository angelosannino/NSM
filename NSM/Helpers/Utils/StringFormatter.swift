import Foundation

enum StringEdge {
    case leading, trailing
}

final class StringFormatter {
    private typealias RemoveEdgeCharacterRule = (rule: (StringEdge) -> Bool, action: (String, inout String) -> Void)

    private lazy var removeEdgeCharacterRules: [RemoveEdgeCharacterRule] = [
        ({ $0 == .leading }, removeLeading),
        ({ $0 == .trailing }, removeTrailing)
    ]

    func removeEdgeCharacter(_ character: String, from string: String, edges: [StringEdge] = [.leading, .trailing]) -> String {
        edges.reduce(into: string) { result, edge in
            removeEdgeCharacterRules.first { $0.rule(edge) }?.action(character, &result)
        }
    }
}

private extension StringFormatter {
    private func removeLeading(_ character: String, from string: inout String) {
        string = string.enumerated()
            .map { ($0.offset == 0 && String($0.element) == character) ? Constants.emptyString : String($0.element) }
            .joined()
    }

    private func removeTrailing(_ character: String, from string: inout String) {
        string = string.enumerated()
            .map { ($0.offset == string.count - 1 && String($0.element) == character) ? Constants.emptyString : String($0.element) }
            .joined()
    }
}
