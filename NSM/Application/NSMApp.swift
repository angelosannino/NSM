import SwiftUI
import FirebaseCore

@main
struct NSMApp: App {
    @StateObject var viewFactory: ViewFactory

    init() {
        FirebaseApp.configure()
        let authorization = FirebaseAuthProvider()
        let firestore = FirestoreProvider()
        let serviceProvider = ServiceProvider(firestore: firestore, authorization: authorization)
        _viewFactory = StateObject(wrappedValue: ViewFactory(serviceProvider: serviceProvider))
    }

    var body: some Scene {
        WindowGroup {
            viewFactory.loadLogin()
                .environmentObject(viewFactory)
        }
    }
}
