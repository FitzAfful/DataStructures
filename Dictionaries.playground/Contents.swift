import UIKit

func greet(_ name: inout String) {
    name = name.uppercased()
    print("Greetings, \(name)!")
}

var name = "Mal"
greet(name)
print("Goodbye, \(name)!")

//Get First Repeated Character from String using Sets
func getFirstRepeatedSet(_ str: String) -> Character? {
    var values: Set<Character> = Set()
    for item in Array(str) {
        if(values.contains(item)){
            return item
        }
        values.insert(item)
    }
    return nil
}

print(getFirstRepeatedSet("green apple"))






//Get First Repeated Character from String
func getFirstRepeatedChar(_ str: String) -> Character? {
    var values: [Character: Int] = [:]
    for item in Array(str) {
        if(values.keys.contains(item)) {
            values.updateValue(values[item]! + 1, forKey: item)
        }else {
            values.updateValue(1, forKey: item)
        }
    }
    for item in Array(str) {
        if(values[item]! > 1) {
            return item
        }
    }

    return nil
}

print(getFirstRepeatedChar("green apple"))

//Get First Non repeated character from String
func getFirstNonRepeatedChar(_ str: String) -> Character? {
    var values: [Character: Int] = [:]
    for item in Array(str) {
        if(values.keys.contains(item)) {
            values.updateValue(values[item]! + 1, forKey: item)
        }else {
            values.updateValue(1, forKey: item)
        }
    }
    for item in Array(str) {
        if(values[item] == 1) {
            return item
        }
    }

    return nil
}

print(getFirstNonRepeatedChar("a green apple"))
