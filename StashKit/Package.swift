// swift-tools-version: 6.4
import PackageDescription

let features = ["VaultFeature", "FundsFeature", "WorkLogFeature", "SettingsFeature"]
let core = ["Models", "DesignSystem", "Scanning", "Reminders", "Export"]

let package = Package(
    name: "StashKit",
    defaultLocalization: "en",
    platforms: [.iOS(.v26)],
    products: (features + core).map { .library(name: $0, targets: [$0]) },
    targets: [
        // Core
        .target(name: "Models"),
        .target(name: "DesignSystem"),
        .target(name: "Scanning"),
        .target(name: "Reminders"),
        .target(name: "Export", dependencies: ["Models"]),

        // Features
        .target(name: "VaultFeature",
                dependencies: ["Models", "DesignSystem", "Scanning", "Reminders"]),
        .target(name: "FundsFeature",
                dependencies: ["Models", "DesignSystem", "Reminders"]),
        .target(name: "WorkLogFeature",
                dependencies: ["Models", "DesignSystem", "Export"]),
        .target(name: "SettingsFeature",
                dependencies: ["Models", "DesignSystem"]),

        // Tests
        .testTarget(name: "ModelsTests", dependencies: ["Models"]),
        .testTarget(name: "FundsFeatureTests", dependencies: ["FundsFeature"]),
        .testTarget(name: "ExportTests", dependencies: ["Export"]),
    ]
)
