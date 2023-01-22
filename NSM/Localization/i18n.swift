import Foundation

enum i18n {}

extension i18n {
    enum Labels {
        static var userLogin: String { "user.login".localized }
        static var email: String { "email".localized }
        static var username: String { "username".localized }
        static var password: String { "password".localized }
        static var type: String { "type".localized }
        static var name: String { "name".localized }
        static var surname: String { "surname".localized }
        static var title: String { "title".localized }
        static var icon: String { "icon".localized }
        static var link: String { "link".localized }
        static var hello: String { "hello".localized }
        static var settings: String { "settings_label".localized }
        static var users: String { "users_label".localized }
        static var buttons: String { "buttons_label".localized }
        static var addNewUser: String { "add.new.user".localized }
        static var editUser: String { "edit.user".localized }
        static var addNewButton: String { "add.new.button".localized }
        static var editButton: String { "edit.button".localized }
        static var allowedButtons: String { "allowed.buttons".localized }
        static var buttonsManagement: String { "buttons.management".localized }
        static var availableForUser: String { "available.for.user".localized }
        static var availableButtons: String { "available.buttons".localized }
        static var home: String { "home".localized }
        static var adminTools: String { "admin.tools".localized }
        static var userDetails: String { "user.details".localized }
        static var buttonDetails: String { "button.details".localized }
        static var selectedIcon: String { "selected.icon".localized }
        static var pickYourIcon: String { "pick.your.icon".localized }
        static var passwordChange: String { "password.change".localized }
        static var newPassword: String { "new.password".localized }
        static var repeatPassword: String { "repeat.password".localized }
        static var passwordResetTitle: String { "password.reset.title".localized }
        static var passwordResetSubtitle: String { "password.reset.subtitle".localized }
        static var forgottenPassword: String { "forgotten.password".localized }
        static var keepMeSignedIn: String { "keep.me.signed.in".localized }
        static var nsmContactLabel: String { "nsm.contact.label".localized }
    }
}

extension i18n {
    enum Buttons {
        static var login: String { "login".localized }
        static var logout: String { "logout".localized }
        static var changePassword: String { "change.password".localized }
        static var settings: String { "settings".localized }
        static var back: String { "back".localized }
        static var addButton: String { "add.button".localized }
        static var addUser: String { "add.user".localized }
        static var users: String { "users_button".localized }
        static var buttons: String { "buttons_button".localized }
        static var cancel: String { "cancel".localized }
        static var confirm: String { "confirm".localized }
        static var manageButtons: String { "manage.buttons".localized }
        static var ok: String { "ok".localized }
        static var edit: String { "edit".localized }
        static var delete: String { "delete".localized }
    }
}

extension i18n {
    enum Alerts {
        static var fillInAllFields: String { "fill.in.all.fields".localized }
        static var userAddedTitle: String { "user.added.title".localized }
        static var userAddedMessage: String { "user.added.message".localized }
        static var failedToAddUserTitle: String { "add.user.failure.title".localized }
        static var failedToAddUserMessage: String { "add.user.failure.message".localized }
        static var userEditedTitle: String { "user.edited.title".localized }
        static var userEditedMessage: String { "user.edited.message".localized }
        static var failedToEditUserTitle: String { "edit.user.failure.title".localized }
        static var failedToEditUserMessage: String { "edit.user.failure.message".localized }
        static var failedToDeleteUserTitle: String { "user.delete.error.title".localized }
        static var failedToDeleteUserMessage: String { "user.delete.error.message".localized }
        static var confirmDeleteUserTitle: String { "user.delete.confirm.title".localized }
        static var confirmDeleteUserMessage: String { "user.delete.confirm.message".localized }
        static var buttonAddedTitle: String { "button.added.title".localized }
        static var buttonAddedMessage: String { "button.added.message".localized }
        static var failedToAddButtonTitle: String { "add.button.failure.title".localized }
        static var failedToAddButtonMessage: String { "add.button.failure.message".localized }
        static var buttonEditedTitle: String { "button.edited.title".localized }
        static var buttonEditedMessage: String { "button.edited.message".localized }
        static var failedToEditButtonTitle: String { "edit.button.failure.title".localized }
        static var failedToEditButtonMessage: String { "edit.button.failure.message".localized }
        static var failedToDeleteButtonTitle: String { "button.delete.error.title".localized }
        static var failedToDeleteButtonMessage: String { "button.delete.error.message".localized }
        static var confirmDeleteButtonTitle: String { "button.delete.confirm.title".localized }
        static var confirmDeleteButtonMessage: String { "button.delete.confirm.message".localized }
        static var passwordUpdatedTitle: String { "password.updated.title".localized }
        static var passwordUpdatedMessage: String { "password.updated.message".localized }
        static var failedToUpdatePasswordTitle: String { "password.update.error.title".localized }
        static var failedToUpdatePasswordMessage: String { "password.update.error.message".localized }
        static var confirmResetPasswordTitle: String { "password.reset.confirm.title".localized }
        static var confirmResetPasswordMessage: String { "password.reset.confirm.message".localized }
        static var passwordResettedTitle: String { "password.resetted.title".localized }
        static var passwordResettedMessage: String { "password.resetted.message".localized }
        static var failedToResetPasswordTitle: String { "password.reset.failure.title".localized }
        static var failedToResetPasswordMessage: String { "password.reset.failure.message".localized }
        static var provideValidEmail: String { "provide.valid.email.message".localized }
    }
}

extension i18n {
    enum UserTypes {
        static var admin: String { "admin".localized }
        static var employee: String { "employee".localized }
        static var customer: String { "customer".localized }
        static var guest: String { "guest".localized }
    }
}

private extension String {
    var localized: String {
        NSLocalizedString(self, comment: Constants.emptyString)
    }
}
