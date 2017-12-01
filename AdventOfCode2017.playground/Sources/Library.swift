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
