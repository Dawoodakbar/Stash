import Foundation
import SwiftData

/// A purchase the user wants to keep track of.
///
/// Every property has a default and every relationship is optional so the
/// store can be synced with iCloud later without a migration.
@Model
public final class Receipt {
    
    public var uid : UUID = UUID()
    public var merchant: String = ""
    /// Money is always `Decimal`: `Double` rounding produces wrong totals.
    public var total: Decimal = 0
    public var currencyCode: String = "USD"
    public var purchaseDate: Date = Date.now
    public var category: String = "other"
    public var notes: String = ""
    /// Stored as a file next to the database, not inside it.
    @Attribute(.externalStorage) public var imageData: Data?
    public var returnDeadline: Date?
    public var warrantyEnd: Date?
    public var isBusinessExpense: Bool = false
    /// The fund this purchase was paid from, if any.
    public var fund: Fund?

    public init(
        merchant: String = "",
        total: Decimal = 0,
        purchaseDate: Date = .now,
        returnDeadline: Date? = nil,
        warrantyEnd: Date? = nil
    ) {
        self.merchant = merchant
        self.total = total
        self.purchaseDate = purchaseDate
        self.returnDeadline = returnDeadline
        self.warrantyEnd = warrantyEnd
    }
}
