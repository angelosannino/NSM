import Foundation

extension String {
    var removingEdgeSpaces: String {
        removingEdgeCharacter(Constants.emptySpace, edges: [.leading, .trailing])
    }
}
