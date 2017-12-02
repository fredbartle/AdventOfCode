import Foundation

public func input(_ filename: String) -> String {
    let fileURL = Bundle.main.url(forResource: filename, withExtension: nil)
    do {
        return try String(contentsOf: fileURL!).trimmingCharacters(in: .whitespacesAndNewlines)
    }
    catch {
        return ""
    }

}

public func parse(_ input: String) -> [[Int]] {
    return input
        .components(separatedBy: .newlines)
        .map { $0.split(separator: " ").flatMap { Int($0) } }
}
