import Foundation
import SwiftData

/// Money added to a fund.
@Model
public final class Contribution {
    public var amount: Decimal = 0
    public var date: Date = Date.now
    public var note: String = ""
    public var fund: Fund?

    public init(amount: Decimal = 0, date: Date = .now, note: String = "") {
        self.amount = amount
        self.date = date
        self.note = note
    }
}
