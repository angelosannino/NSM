import SwiftUI

struct DisabledModifier: ViewModifier {
    let condition: Bool
    let color: Color
    let disabledColor: Color

    func body(content: Content) -> some View {
        content
            .disabled(condition)
            .foregroundColor(condition ? disabledColor : color)
    }
}

extension View {
    func disable(if condition: Bool,
                 color: Color = Constants.Layout.defaultTextColor,
                 disabledColor: Color = Constants.Layout.defaultDisabledColor) -> some View {
        modifier(DisabledModifier(condition: condition, color: color, disabledColor: disabledColor))
    }
}
