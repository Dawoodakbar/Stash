import SwiftUI
import SwiftData
import Models

@main
struct StashApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: StashSchema.models)
    }
}
