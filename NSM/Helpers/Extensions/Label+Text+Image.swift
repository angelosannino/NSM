import SwiftUI

extension Label where Title == Text, Icon == Image {
    static func with(text: String, icon: String) -> Label {
        Label(title: { Text(text) }, icon: { Image(systemName: icon)})
    }
}
