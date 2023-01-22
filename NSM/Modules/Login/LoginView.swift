import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel

    var body: some View {
        Text("Hello, World!")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: .sample)
    }
}
