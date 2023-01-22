import SwiftUI

enum Constants {
    static let emptyString = ""
    static let emptySpace = " "
    static let defaultUserPassword = "password1"
    static let questionMark = "?"
    static let nsmContactEmail = "info@nauticsm.com"
}

extension Constants {
    enum Labels {
        static let defaultNavigationTitle = "NSM"
        static let defaultNavigationSubtitle = Constants.emptyString
    }
}

extension Constants {
    enum Icons {
        static let settings = "gear"
        static let changePasswod = "key"
        static let logout = "rectangle.portrait.and.arrow.right"
        static let back = "arrowshape.turn.up.backward.2.circle"
//        static let addButton = "plus.square.on.square"
        static let users = "person.2"
        static let button = "link.circle"
        static let link = "link"
        static let admin = "person.badge.key"
        static let employee = "person"
        static let customer = "cart"
        static let guest = "person.crop.circle.badge.questionmark"
        static let addUser = "person.badge.plus"
        static let addButton = "link.badge.plus"
        static let plusButton = "plus.circle"
        static let minusButton = "minus.circle"
        static let rightArrow = "chevron.right"
        static let leftArrow = "chevron.left"
    }
}

extension Constants {
    enum Layout {
        static let primaryColor: Color = Color("Primary")
        static let secondaryColor: Color = Color("Secondary")
        static let navigationBarColor: Color = primaryColor
        static let navigationBarTextColor: Color = secondaryColor
        static let defaultTextColor: Color = Color("Text")
        static let defaultDestructiveColor: Color = .red
        static let defaultConfirmColor: Color = .green
        static let defaultDisabledColor: Color = .gray
        static let defauldDisabledTextColor: Color = Color(uiColor: .lightGray)
    }
}

extension Constants {
    enum Storage {
        static let loginDetails = "loginDetails"
    }
}

extension Constants {
    enum Resources {
        static let nsmLogo = "logo"
        static let nsmNavBarLogo = "logo-navbar"
    }
}
