import Foundation

extension String {
    func removingEdgeCharacter(_ character: String, edges: [StringEdge] = [.leading, .trailing]) -> String {
        StringFormatter().removeEdgeCharacter(character, from: self, edges: edges)
    }
}
