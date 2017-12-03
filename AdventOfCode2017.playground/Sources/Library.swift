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

public enum Direction {

    case Up
    case Down
    case Left
    case Right

    public func next() -> Direction {
        switch self {
        case .Up:
            return .Left
        case .Left:
            return .Down
        case .Down:
            return .Right
        case .Right:
            return .Up
        }
    }

    public var vector: Complex {
        switch self {
        case .Up:
            return Complex(0, 1)
        case .Down:
            return Complex(0, -1)
        case .Left:
            return Complex(-1, 0)
        case .Right:
            return Complex(1, 0)
        }
    }

}
