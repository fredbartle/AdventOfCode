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

/*

 Day 4 part 2

 abcde fghij is a valid passphrase.
 abcde xyz ecdab is not valid - the letters from the third word can be rearranged to form the first word.
 a ab abc abd abf abj is a valid passphrase, because all letters need to be used when forming another word.
 iiii oiii ooii oooi oooo is valid.
 oiii ioii iioi iiio is not valid - any of these words can be rearranged to form any other word.

 */

func validPassphrase2(_ text: String) -> Bool {
    let array = text.components(separatedBy: .whitespaces).map { String($0.sorted()) }.sorted()
    let unique = Array(Set(array)).sorted()
    return array == unique
}

func validateList2(_ list: [String]) -> Int {
    return list.filter { validPassphrase2($0) }.count
}

assert(validPassphrase2("abcde fghij"))
assert(!validPassphrase2("abcde xyz ecdab"))
assert(validPassphrase2("a ab abc abd abf abj"))
assert(validPassphrase2("iiii oiii ooii oooi oooo"))
assert(!validPassphrase2("oiii ioii iioi iiio"))

// 223
validateList2(passphraseList)
