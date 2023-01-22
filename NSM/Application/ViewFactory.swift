import Foundation

protocol ViewFactoryProtocol: ObservableObject {
    func loadLogin() -> LoginView
}

class ViewFactory: ViewFactoryProtocol {
    private let serviceProvider: ServiceProviderProtocol

    init(serviceProvider: ServiceProviderProtocol) {
        self.serviceProvider = serviceProvider
    }

    func loadLogin() -> LoginView {
        let viewModel = LoginViewModel()
        return LoginView(viewModel: viewModel)
    }
}
