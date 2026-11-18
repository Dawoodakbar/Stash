import Foundation
import SwiftData

/// A journey logged for mileage.
@Model
public final class Trip {
    public var startTime: Date = Date.now
    public var endTime: Date = Date.now
    /// Always metres; convert to miles or kilometres only for display.
    public var distanceMeters: Double = 0
    public var purpose: String = ""
    public var startPlace: String = ""
    public var endPlace: String = ""
    public var isBusiness: Bool = true

    public init(
        startTime: Date = .now,
        endTime: Date = .now,
        distanceMeters: Double = 0,
        purpose: String = ""
    ) {
        self.startTime = startTime
        self.endTime = endTime
        self.distanceMeters = distanceMeters
        self.purpose = purpose
    }
}
