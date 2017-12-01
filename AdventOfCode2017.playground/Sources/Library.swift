import Foundation

public func input(_ filename: String) -> String {
    let fileURL = Bundle.main.url(forResource: "day1input", withExtension: nil)
    do {
        return try String(contentsOf: fileURL!).trimmingCharacters(in: .whitespacesAndNewlines)
    }
    catch {
        return ""
    }

}

extension Array {

    public func shiftRight(_ amount: Int = 1) -> [Element] {
        var amount = amount
        assert(-count...count ~= amount, "Shift amount out of bounds")
        if amount < 0 { amount += count }  // this needs to be >= 0
        return Array(self[amount ..< count] + self[0 ..< amount])
    }

    public mutating func shiftRightInPlace(amount: Int = 1) {
        self = shiftRight(amount)
    }

}
