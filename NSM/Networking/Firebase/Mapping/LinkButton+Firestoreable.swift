import Foundation

extension LinkButton: Firestoreable {
    init?(_ data: [String: Any]) {
        guard let id = data[Constants.Firebase.Keys.id] as? String,
              let title = data[Constants.Firebase.Keys.title] as? String,
              let link = data[Constants.Firebase.Keys.link] as? String,
              let icon = data[Constants.Firebase.Keys.icon] as? String else { return nil }
        self.id = id
        self.title = title
        self.link = link
        self.icon = icon
    }

    var data: [String : Any] {
        [
            Constants.Firebase.Keys.id: id,
            Constants.Firebase.Keys.title: title,
            Constants.Firebase.Keys.link: link,
            Constants.Firebase.Keys.icon: icon
        ]
    }

    var identifier: String { id }
}
