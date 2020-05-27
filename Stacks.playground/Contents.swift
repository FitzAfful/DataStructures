import UIKit

//refactored form of isStringBalanced
func isStringBalancedDictionary(_ input: String) -> Bool {
    let brackets = ["{":"}", "[":"]", "(":")", "<":">"]
    var stack:[Character] = []

    for item in Array(input) {
        if(brackets.keys.contains(String(item))) {
            stack.append(item)
            print(stack)
        }

        if(brackets.values.contains(String(item))) {
            if(stack.isEmpty) { return false }
            let popped = stack.removeLast()
            let keyIndex = brackets.keys.firstIndex(of: String(popped))!
            let valueIndex = brackets.values.firstIndex(of: String(item))
            if(keyIndex != valueIndex) { return false }
            print(stack)
        }
    }
    return stack.isEmpty
}

print(isStringBalancedDictionary("(([1] + <2>))"))




// Check if a string is balanced. for eg. "(1 + 2)" is balanced. "(1 +" is not balanced
func isStringBalanced(str: String) -> Bool {
    var stack:[Character] = []
    for item in Array(str) {
        if((String(item) == "(") || (String(item) == "[") || (String(item) == "<") || (String(item) == "{")) {
            stack.append(item)
        }
        if((String(item) == ")") || (String(item) == "]") || (String(item) == ">") || (String(item) == "}")) {
            if (stack.isEmpty) { return false }
            let top = stack.removeLast()
            if((String(item) == String("(") && (String(top) != ")")) || (String(item) == String("[") && (String(top) != "]")) ||  (String(item) == String("<") && (String(top) != ">")) || (String(item) == String("{") && (String(top) != "}"))) {
                return false
            }
        }
    }
    return stack.isEmpty
}

print(isStringBalanced(str: "(([1] + <2>))"))
//print(isStringBalanced(str: "(([1] + <2]))"))







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

