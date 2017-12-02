//: Playground - noun: a place where people can play

import UIKit

let day2input = input("day2input")
let day2data = parse(day2input)

func findDivisible(in values: [Int]) -> [Int] {
    let s = Array(values.sorted().reversed())
    let t = Array(s[1...])
    let x = s.first!
    for y in t {
        if x % y == 0 {
            return [x, y]
        }
    }
    return findDivisible(in: t)
}

func checksum(data: [[Int]]) -> Int {
    return data.map { $0.max()! - $0.min()! }.reduce(0, +)
}

func checksum2(data: [[Int]]) -> Int {
    return data
        .map { findDivisible(in: $0) }.map { $0.max()! / $0.min()! }
        .reduce(0, +)
}

// part 1

let part1test = """
5 1 9 5
7 5 3
2 4 6 8
"""

let part1testData = parse(part1test)
assert(checksum(data: part1testData) == 18)

checksum(data: day2data)

// part 2

let part2test = """
5 9 2 8
9 4 7 3
3 8 6 5
"""

let part2testData = parse(part2test)
assert(checksum2(data: part2testData) == 9)

checksum2(data: day2data)

