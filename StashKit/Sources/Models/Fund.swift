import Foundation
import SwiftData

/// A savings pot for a planned or irregular cost.
@Model
public final class Fund {
    public var name: String = ""
    public var targetAmount: Decimal = 0
    public var targetDate: Date?
    public var iconName: String = "banknote"

    /// Deleting a fund deletes its contributions.
    @Relationship(deleteRule: .cascade, inverse: \Contribution.fund)
    public var contributions: [Contribution]? = []

    /// Deleting a fund only unlinks its receipts; the receipts survive.
    @Relationship(deleteRule: .nullify, inverse: \Receipt.fund)
    public var receipts: [Receipt]? = []

    public init(name: String = "", targetAmount: Decimal = 0, targetDate: Date? = nil) {
        self.name = name
        self.targetAmount = targetAmount
        self.targetDate = targetDate
    }

    /// Money put in minus money spent. Calculated, never stored, so it
    /// cannot drift out of step with the contributions and receipts.
    public var balance: Decimal {
        let added = (contributions ?? []).reduce(Decimal(0)) { $0 + $1.amount }
        let spent = (receipts ?? []).reduce(Decimal(0)) { $0 + $1.total }
        return added - spent
    }
}
