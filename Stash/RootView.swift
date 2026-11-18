import SwiftUI
import VaultFeature
import FundsFeature
import WorkLogFeature
import SettingsFeature

/// The app's top level: one tab per feature module.
struct RootView: View {
    var body: some View {
        TabView {
            Tab("Vault", systemImage: "doc.text.viewfinder") { VaultRootView() }
            Tab("Funds", systemImage: "banknote") { FundsRootView() }
            Tab("Work", systemImage: "car") { WorkLogRootView() }
            Tab("Settings", systemImage: "gearshape") { SettingsRootView() }
        }
    }
}

#Preview {
    RootView()
}
