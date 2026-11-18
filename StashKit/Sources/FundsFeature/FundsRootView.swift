import SwiftUI

/// The Funds tab: savings pots for planned costs.
public struct FundsRootView: View {
    public init() {}

    public var body: some View {
        NavigationStack {
            ContentUnavailableView("No funds yet", systemImage: "banknote")
                .navigationTitle("Funds")
        }
    }
}

#Preview {
    FundsRootView()
}
