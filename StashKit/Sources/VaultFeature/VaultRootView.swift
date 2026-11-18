import SwiftUI

/// The Vault tab: receipts and their return and warranty deadlines.
public struct VaultRootView: View {
    public init() {}

    public var body: some View {
        NavigationStack {
            ContentUnavailableView("No receipts yet", systemImage: "doc.text")
                .navigationTitle("Vault")
        }
    }
}

#Preview {
    VaultRootView()
}
