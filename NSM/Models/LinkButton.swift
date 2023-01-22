import SwiftUI

struct LinkButton: Identifiable, Equatable, Codable, Hashable {
    var id: String

    let title: String
    let link: String
    let icon: String

    var image: Image {
        Image(systemName: icon)
    }

    init(id: String = UUID().uuidString,
         title: String,
         link: String,
         icon: String = Constants.emptyString) {
        self.id = id
        self.title = title
        self.link = link
        self.icon = icon
    }
}

extension LinkButton {
    static var sample: [LinkButton] {
        [
            LinkButton(title: "Apple", link: "", icon: "applelogo"),
            LinkButton(title: "Star", link: "", icon: "star"),
            LinkButton(title: "Person", link: "", icon: "person")
        ]
    }
}
