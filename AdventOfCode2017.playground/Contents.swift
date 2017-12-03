/*

 17  16  15  14  13
 18   5   4   3  12
 19   6   1   2  11
 20   7   8   9  10
 21  22  23---> ...

 1 -> 0
 12 -> 3
 23 -> 2
 1024 -> 31

 265149 -> ?

 1 -> 2 (1, 0)
 2 -> 3 (0, 1)
 3 -> 4 (-1, 0)
 4 -> 5 (-1, 0)
 5 -> 6 (0, -1)
 6 -> 7 (0, -1)
 7 -> 8 (1, 0)
 8 -> 9 (1, 0)
 9 -> 10 (1, 0


 [X] 1 (0, 0)
 [1] 2 (1, 0)
 [1] 3 (1, 1)
 [2] 5 (-1, 1)
 [2] 7 (-1, -1)
 [3] 10 (2, -1)
 [3] 13 (2, 2)
 [4] 17 (-2, 2)
 [4] 21 (-2, -2)
 [5] 26 (3, -2)
 [5] 31 (3, 3)
 [6] 37 (-3, 3)
 [6] 43 (-3, -3)

 */

enum Direction {
    case U
    case D
    case L
    case R

    func next() -> Direction {
        switch self {
        case .U:
            return .L
        case .L:
            return .D
        case .D:
            return .R
        case .R:
            return .U
        }
    }

    var vector: Complex {
        switch self {
        case .U:
            return Complex(0, 1)
        case .D:
            return Complex(0, -1)
        case .L:
            return Complex(-1, 0)
        case .R:
            return Complex(1, 0)
        }
    }
}

let origin = Complex(0, 0)

func distance(to position: Complex) -> Double {
    return abs(position.real) + abs(position.imaginary)
}

func findPosition(of target: Int) -> Complex {
    guard target > 1 else { return origin }
    var position = origin
    var direction: Direction = .R
    var n = 1
    var counter = 0
    var twice = false

    (1..<target).forEach { _ in
//        print(i, n, counter, i, position)
        if counter == n {
            if twice {
                n += 1
                twice = false
            } else {
                twice = true
            }

            counter = 0
            direction = direction.next()
//            print(direction)
        }
        counter += 1
        position += direction.vector
//        if counter == (n - 1) {
//            n += 1
//            counter = 0
//            direction = direction.next()
//            print(direction)
//        }
    }

    return position
}

assert(distance(to: findPosition(of: 1)) == 0)
assert(distance(to: findPosition(of: 12)) == 3)
assert(distance(to: findPosition(of: 23)) == 2)
assert(distance(to: findPosition(of: 1024)) == 31)
//distance(to: findPosition(of: 265149))
//for i in 0..<7 {
//    let a = i * i + 1
//    let b = a + i
//    let c = i / 2
//    print(i, a, b, c)
//}


