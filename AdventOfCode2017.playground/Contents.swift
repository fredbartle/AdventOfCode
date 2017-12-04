/*

 Day 4 part 1

 aa bb cc dd ee is valid.
 aa bb cc dd aa is not valid - the word aa appears more than once.
 aa bb cc dd aaa is valid - aa and aaa count as different words.

 */

let day4input = input("day4input")
let passphraseList = day4input.components(separatedBy: .newlines)

func validPassphrase1(_ text: String) -> Bool {
    let array = text.components(separatedBy: .whitespaces).sorted()
    let unique = Array(Set(array)).sorted()
    return array == unique
}

func validateList1(_ list: [String]) -> Int {
    return list.filter { validPassphrase1($0) }.count
}

assert(validPassphrase1("aa bb cc dd ee"))
assert(!validPassphrase1("aa bb cc dd aa"))
assert(validPassphrase1("aa bb cc dd aaa"))

// 451
validateList1(passphraseList)
