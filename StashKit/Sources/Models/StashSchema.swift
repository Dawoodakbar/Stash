import SwiftData

/// Every model type the app stores, in one place so the app and previews
/// always register the same list.
public enum StashSchema {
    public static let models: [any PersistentModel.Type] = [
        Receipt.self,
        Fund.self,
        Contribution.self,
        Trip.self,
    ]

    /// An in-memory store for SwiftUI previews and tests.
    @MainActor
    public static func previewContainer() throws -> ModelContainer {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        return try ModelContainer(for: Schema(models), configurations: config)
    }
}
