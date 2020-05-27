import UIKit

//Using Stacks to reverse String
func reverseString(str: String) -> String {
    var array = Array(str)
    var newStr = ""

    while !array.isEmpty {
        newStr = newStr + String(array.removeLast())
    }
    return newStr
}

print(reverseString(str: "abcdefghij"))
