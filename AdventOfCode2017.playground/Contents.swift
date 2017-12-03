/*

 17  16  15  14  13
 18   5   4   3  12
 19   6   1   2  11
 20   7   8   9  10
 21  22  23---> ...

// layer        0, 1, 2,  3,  4 ...
// numbers      1, 8, 16, 24, 32
// starting     1, 2, 10, 26, 50

 */

func distance(to position: Complex) -> Double {
    return abs(position.real) + abs(position.imaginary)
}

func findPosition(of target: Int) -> Complex {
    guard target > 1 else { return Complex(0, 0) }

    var start = 1
    var n = 0
    while true {
        let next = (0...n).map { max($0 * 8, 1) }.reduce(0, +) + 1
        if target < next {
            break
        }
        start = next
        n += 1
    }

    var position = Complex(n, -n + 1)
    var direction: Direction = .Up
    var corner = start - 1
    var value = start
    while target != value {
        if value == corner + n * 2 {
            direction = direction.next()
            corner = value
        }
        value += 1
        position += direction.vector
    }

    return position
}

assert(distance(to: findPosition(of: 1)) == 0)
assert(distance(to: findPosition(of: 12)) == 3)
assert(distance(to: findPosition(of: 23)) == 2)
assert(distance(to: findPosition(of: 1024)) == 31)
distance(to: findPosition(of: 265149))

