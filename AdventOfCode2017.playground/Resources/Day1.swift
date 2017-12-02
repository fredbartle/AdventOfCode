let day1input = input("day1input")

func captchaSum(_ text: String, offset by: Int = 1) -> Int {
    return text
        .enumerated()
        .filter { i, char in
            let index = text.index(text.startIndex, offsetBy: (i + by) % text.count)
            return char == text[index]
        }
        .flatMap { Int(String($0.element)) }
        .reduce(0, +)
}

// part 1

assert(captchaSum("1122") == 3)
assert(captchaSum("1111") == 4)
assert(captchaSum("1234") == 0)
assert(captchaSum("91212129") == 9)

captchaSum(day1input)

// part 2

assert(captchaSum("1212", offset: 2) == 6)
assert(captchaSum("1221", offset: 2) == 0)
assert(captchaSum("123425", offset: 3) == 4)
assert(captchaSum("123123", offset: 3) == 12)
assert(captchaSum("12131415", offset: 4) == 4)

captchaSum(day1input, offset: day1input.count / 2)
