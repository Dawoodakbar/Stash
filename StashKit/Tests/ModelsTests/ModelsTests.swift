import Foundation
import SwiftData
import Testing
@testable import Models

@MainActor
struct FundBalanceTests {
    @Test func balanceIsContributionsMinusReceipts() throws {
        let container = try StashSchema.previewContainer()
        let context = container.mainContext

        let fund = Fund(name: "Car repair", targetAmount: 500)
        context.insert(fund)
        fund.contributions = [Contribution(amount: 200), Contribution(amount: 50)]
        fund.receipts = [Receipt(merchant: "Garage", total: 80)]

        #expect(fund.balance == 170)
    }

    @Test func emptyFundHasZeroBalance() {
        #expect(Fund(name: "Gifts").balance == 0)
    }

    @Test func deletingFundKeepsReceipts() throws {
        let container = try StashSchema.previewContainer()
        let context = container.mainContext

        let fund = Fund(name: "Holiday")
        let receipt = Receipt(merchant: "Airline", total: 120)
        context.insert(fund)
        context.insert(receipt)
        receipt.fund = fund
        try context.save()

        context.delete(fund)
        try context.save()

        let receipts = try context.fetch(FetchDescriptor<Receipt>())
        #expect(receipts.count == 1)
        #expect(receipts.first?.fund == nil)
    }
}
