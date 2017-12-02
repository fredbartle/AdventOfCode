//: Playground - noun: a place where people can play

import UIKit

let sample = """
5 1 9 5
7 5 3
2 4 6 8
"""

let day2input = input("day2input")

func parse(_ input: String) -> [[Int]] {
    return input
        .components(separatedBy: .newlines)
        .map { $0.split(separator: " ").flatMap { Int($0) } }
}

func checksum(data: [[Int]]) -> Int {
    return data.map { $0.max()! - $0.min()! }.reduce(0, +)
}

let sampleData = parse(sample)
assert(checksum(data: sampleData) == 18)

let day2data = parse(day2input)
checksum(data: day2data)
