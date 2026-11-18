import SwiftUI

/// The Work tab: business expenses and trips.
public struct WorkLogRootView: View {
    public init() {}

    public var body: some View {
        NavigationStack {
            ContentUnavailableView("No trips yet", systemImage: "car")
                .navigationTitle("Work")
        }
    }
}

#Preview {
    WorkLogRootView()
}
