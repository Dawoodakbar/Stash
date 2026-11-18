import Testing
@testable import FundsFeature

@MainActor
@Test func fundsModuleBuilds() {
    _ = FundsRootView()
}
