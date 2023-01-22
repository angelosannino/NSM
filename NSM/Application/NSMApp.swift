import SwiftUI

@main
struct NSMApp: App {
    @StateObject var viewModel = LoginViewModel()

    var body: some Scene {
        WindowGroup {
            LoginView(viewModel: viewModel)
        }
    }
}
