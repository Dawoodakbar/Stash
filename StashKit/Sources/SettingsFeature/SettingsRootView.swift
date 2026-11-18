import SwiftUI

/// The Settings tab: currency, distance unit and notification preferences.
public struct SettingsRootView: View {
    public init() {}

    public var body: some View {
        NavigationStack {
            Form {
                Text("Settings coming soon")
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsRootView()
}
