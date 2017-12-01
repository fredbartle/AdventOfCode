//: Playground - noun: a place where people can play

import UIKit

let day1input = input("day1input")

func captchaSum(_ text: String) -> Int {
    guard let firstChar = text.first else { return 0 }
    var text = text
    text.append(firstChar)
    var previousChar: Character?
    return text
        .flatMap { char in
            if previousChar == nil {
                previousChar = char
                return nil
            } else if char == previousChar {
                return String(char)
            } else {
                previousChar = char
                return nil
            }
        }
        .flatMap { Int($0) }
        .reduce(0, { $0 + $1 })
}

assert(captchaSum("1122") == 3)
assert(captchaSum("1111") == 4)
assert(captchaSum("1234") == 0)
assert(captchaSum("91212129") == 9)

captchaSum(day1input)

