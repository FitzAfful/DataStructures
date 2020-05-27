import UIKit


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
